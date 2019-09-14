class V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :update, :destroy]

  # GET /reservations
  def index
    if params['start_date']. present? and params['end_date']. present?
      @reservations = Reservation.where("reservation_date between ? and ?",
                                        params['start_date'],
                                        params['end_date'])
    else
      @reservations = Reservation.all
    end


    render json: @reservations
  end

  # GET /reservations/1
  def show
    render json: @reservation
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservations/1
  def update
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def reservation_params
    params.require(:reservation).permit(:film_id, :document_number, :email,
                                        :name, :phone, :reservation_date)
  end
end
