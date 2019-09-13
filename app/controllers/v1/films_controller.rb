class V1::FilmsController < ApplicationController
  before_action :set_film, only: [:show, :update, :destroy]

  # GET /films
  def index
    date = params[:start_date] || Date.today.strftime
    @films = Film.for_date(date)
    render json: @films.as_json(available_seats_for: date)
  end

  # GET /films/1
  def show
    render json: @film
  end

  # POST /films
  def create
    @film = Film.new(film_params)

    if @film.save
      render json: @film, status: :created
    else
      render json: @film.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /films/1
  def update
    if @film.update(film_params)
      render json: @film
    else
      render json: @film.errors, status: :unprocessable_entity
    end
  end

  # DELETE /films/1
  def destroy
    @film.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_film
    @film = Film.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def film_params
    params.require(:film).permit(:name, :description, :start_date, :end_date, :cover_url)
  end
end
