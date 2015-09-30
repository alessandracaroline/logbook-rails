class LogsController < ApplicationController

  before_action :authenticate_user!

  def show
    @trip = Trip.find(params[:trip_id])
    @log = Log.find(params[:id])
    if @trip.user_id == current_user.id
      render 'show'
    else
      redirect_to trips_path
    end
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @log = Log.new
  end

  def edit
    @trip = Trip.find(params[:trip_id])
    @log = Log.find(params[:id])
    if @trip.user_id == current_user.id
      render 'edit'
    else
      redirect_to trips_path
    end
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @log = @trip.logs.new(log_params)

    if @log.save
      redirect_to trip_path(@trip)
    else
      render 'new'
    end
  end

  def update
    @log = Log.find(params[:id])

    if @log.update(log_params)
      redirect_to @log
    else
      render 'edit'
    end
  end

  def destroy
    @log = Log.find(params[:id])
    @trip = @log.trip
    @log.destroy

    redirect_to trip_path(@trip)
  end

  private
    def log_params
      params.require(:log).permit(:latitude_hemisphere, :latitude_degrees, :latitude_minutes, :latitude_seconds, :longitude_hemisphere, :longitude_degrees, :longitude_minutes, :longitude_seconds, :nautical_miles, :incidents)
    end

end
