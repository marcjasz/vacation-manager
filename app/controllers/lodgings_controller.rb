class LodgingsController < ApplicationController
  before_action :set_lodging, only: [:show, :edit, :update, :destroy, :assign_group, :remove_group]

  # GET /lodgings
  # GET /lodgings.json
  def index
    @lodgings = Lodging.all
  end

  # GET /lodgings/1
  # GET /lodgings/1.json
  def show
  end

  # GET /lodgings/new
  def new
    @lodging = Lodging.new
  end

  # GET /lodgings/1/edit
  def edit
  end

  # POST /lodgings
  # POST /lodgings.json
  def create
    @lodging = Lodging.new(lodging_params)

    respond_to do |format|
      if @lodging.save
        format.html { redirect_to @lodging, notice: 'Lodging was successfully created.' }
        format.json { render :show, status: :created, location: @lodging }
      else
        format.html { render :new }
        format.json { render json: @lodging.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lodgings/1
  # PATCH/PUT /lodgings/1.json
  def update
    respond_to do |format|
      if @lodging.update(lodging_params)
        format.html { redirect_to @lodging, notice: 'Lodging was successfully updated.' }
        format.json { render :show, status: :ok, location: @lodging }
      else
        format.html { render :edit }
        format.json { render json: @lodging.errors, status: :unprocessable_entity }
      end
    end
  end

  def assign_group
    group_ids = @lodging.group_ids
    respond_to do |format|
      if group_ids.include?(group_params[:group_id].to_i)
        format.html { redirect_to @lodging, alert: 'Group already assigned.' }
        format.json { render message: 'Group already assigned.', status: :unprocessable_entity }
      elsif @lodging.update!(group_ids: group_ids.append(group_params[:group_id]))
        format.html { redirect_to @lodging, notice: 'Lodging was successfully updated.' }
        format.json { render :show, status: :ok, location: @lodging }
      else
        format.html { redirect_to @lodging, alert: @lodging.errors.full_messages.join(',') }
        format.json { render json: @lodging.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_group
    group_ids = @lodging.group_ids
    respond_to do |format|
      if @lodging.update!(group_ids: group_ids.without(group_params[:group_id].to_i))
        format.html { redirect_to @lodging, notice: 'Lodging was successfully updated.' }
        format.json { render :show, status: :ok, location: @lodging }
      else
        format.html { redirect_to @lodging, alert: @lodging.errors.full_messages.join(',') }
        format.json { render json: @lodging.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lodgings/1
  # DELETE /lodgings/1.json
  def destroy
    @lodging.destroy
    respond_to do |format|
      format.html { redirect_to lodgings_url, notice: 'Lodging was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lodging
      @lodging = Lodging.find(params[:name])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lodging_params
      params.require(:lodging).permit(:owner, :company, :capacity, :address, :name, :phone_number, :email)
    end

    def group_params
      params.permit(:name, :group_id)
    end
end
