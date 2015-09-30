class LogsController < ApplicationController

  def index
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @log = Log.new
  end

end
