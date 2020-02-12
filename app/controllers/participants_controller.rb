class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy, :remove_group, :assign_group]

  # GET /participants
  # GET /participants.json
  def index
    @participants = Participant.all
  end

  # GET /participants/1
  # GET /participants/1.json
  def show
  end

  # GET /participants/new
  def new
    @participant = Participant.new
  end

  # GET /participants/1/edit
  def edit
  end

  # POST /participants
  # POST /participants.json
  def create
    @participant = Participant.new(participant_params)

    respond_to do |format|
      if @participant.save
        format.html { redirect_to @participant, notice: 'Participant was successfully created.' }
        format.json { render :show, status: :created, location: @participant }
      else
        format.html { render :new }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participants/1
  # PATCH/PUT /participants/1.json
  def update
    respond_to do |format|
      if @participant.update(participant_params)
        format.html { redirect_to @participant, notice: 'Participant was successfully updated.' }
        format.json { render :show, status: :ok, location: @participant }
      else
        format.html { render :edit }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  def assign_group
    participation = Participation.find_or_create_by(participant_pesel: group_params[:pesel], group_id: group_params[:group_id])
    respond_to do |format|
      if participation.valid?
        format.html { redirect_to @participant, notice: 'Participant was successfully updated.' }
        format.json { render :show, status: :ok, location: @participant }
      else
        format.html { redirect_to @participant, alert: participation.errors.full_messages.join(',') }
        format.json { render json: participation.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_group
    participation = Participation.find_by(participant_pesel: group_params[:pesel], group_id: group_params[:group_id])
    respond_to do |format|
      if participation&.destroy
        format.html { redirect_to @participant, notice: 'Participant was successfully updated.' }
        format.json { render :show, status: :ok, location: @participant }
      else
        format.html { redirect_to @participant, alert: participation.errors.full_messages.join(',') }
        format.json { render json: participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participants/1
  # DELETE /participants/1.json
  def destroy
    respond_to do |format|
      if @participant.destroy
        format.html { redirect_to @participant, notice: 'Participant was successfully updated.' }
        format.json { render :show, status: :ok, location: @participant }
      else
        format.html { redirect_to @participant, alert: @participant.errors.full_messages.join(',') }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:pesel])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participant_params
      params.require(:participant).permit(:pesel, :name, :surname, :school, :phone_number)
    end

    def group_params
      params.permit(:pesel, :group_id)
    end
end
