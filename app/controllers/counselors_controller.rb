class CounselorsController < ApplicationController
  before_action :set_counselor, only: [:show, :edit, :update, :destroy, :assign_group, :remove_group]

  # GET /counselors
  # GET /counselors.json
  def index
    @counselors = Counselor.all
  end

  # GET /counselors/1
  # GET /counselors/1.json
  def show
  end

  # GET /counselors/new
  def new
    @counselor = Counselor.new
  end

  # GET /counselors/1/edit
  def edit
  end

  # POST /counselors
  # POST /counselors.json
  def create
    @counselor = Counselor.new(counselor_params)

    respond_to do |format|
      if @counselor.save
        format.html { redirect_to @counselor, notice: 'Counselor was successfully created.' }
        format.json { render :show, status: :created, location: @counselor }
      else
        format.html { render :new }
        format.json { render json: @counselor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /counselors/1
  # PATCH/PUT /counselors/1.json
  def update
    respond_to do |format|
      if @counselor.update(counselor_params)
        format.html { redirect_to @counselor, notice: 'Counselor was successfully updated.' }
        format.json { render :show, status: :ok, location: @counselor }
      else
        format.html { render :edit }
        format.json { render json: @counselor.errors, status: :unprocessable_entity }
      end
    end
  end

  def assign_group
    group_ids = @counselor.group_ids
    respond_to do |format|
      if group_ids.include?(group_params[:group_id].to_i)
        format.html { redirect_to @counselor, alert: 'Group already assigned.' }
        format.json { render message: 'Group already assigned.', status: :unprocessable_entity }
      elsif @counselor.update!(group_ids: group_ids.append(group_params[:group_id]))
        format.html { redirect_to @counselor, notice: 'Counselor was successfully updated.' }
        format.json { render :show, status: :ok, location: @counselor }
      else
        format.html { redirect_to @counselor, alert: @counselor.errors.full_messages.join(',') }
        format.json { render json: @counselor.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_group
    group_ids = @counselor.group_ids
    respond_to do |format|
      if @counselor.update!(group_ids: group_ids.without(group_params[:group_id].to_i))
        format.html { redirect_to @counselor, notice: 'Counselor was successfully updated.' }
        format.json { render :show, status: :ok, location: @counselor }
      else
        format.html { redirect_to @counselor, alert: @counselor.errors.full_messages.join(',') }
        format.json { render json: @counselor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /counselors/1
  # DELETE /counselors/1.json
  def destroy
    @counselor.destroy
    respond_to do |format|
      format.html { redirect_to counselors_url, notice: 'Counselor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_counselor
      @counselor = Counselor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def counselor_params
      params.require(:counselor).permit(:pesel, :name, :surname, :address, :phone_number, :group_ids)
    end

    def group_params
      params.permit(:id, :group_id)
    end
end
