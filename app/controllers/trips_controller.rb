class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def edit
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to @trip
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private
    def trip_params
      params.require(:trip).permit(:title, :skipper_name, :boat_name, :boat_type, :start_date, :end_date, :origin, :destination)
    end

end
