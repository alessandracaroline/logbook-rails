class LogsController < ApplicationController

  def show
    @trip = Trip.find(params[:trip_id])
    @log = Log.find(params[:id])
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @log = Log.new
  end

  def edit
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
  end

  def destroy
  end

  private
    def log_params
      params.require(:log).permit(:latitude_hemisphere, :latitude_degrees, :latitude_minutes, :latitude_seconds, :longitude_hemisphere, :longitude_degrees, :longitude_minutes, :longitude_seconds, :nautical_miles, :incidents)
    end

end
