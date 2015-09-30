class TripsController < ApplicationController

  before_action :authenticate_user!

  def index
    @trips = current_user.trips.all
  end

  def show
    @trip = Trip.find(params[:id])
    if @trip.user_id == current_user.id
      render 'show'
    else
      redirect_to trips_path
    end
  end

  def new
    @trip = Trip.new
  end

  def edit
    @trip = Trip.find(params[:id])
    if @trip.user_id == current_user.id
      render 'edit'
    else
      redirect_to trips_path
    end
  end

  def create
    @user = User.find(current_user.id)
    @trip = @user.trips.new(trip_params)

    if @trip.save
      redirect_to @trip
    else
      render 'new'
    end
  end

  def update
    @trip = Trip.find(params[:id])

    if @trip.update(trip_params)
      redirect_to @trip
    else
      render 'edit'
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    redirect_to trips_path
  end

  private
    def trip_params
      params.require(:trip).permit(:title, :skipper_name, :boat_name, :boat_type, :start_date, :end_date, :origin, :destination)
    end

end
