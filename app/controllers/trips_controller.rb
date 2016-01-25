class TripsController < ApplicationController
  def index
    @trips = current_user.trips.order(started_at: :desc)
    @ave_cost = Trip.average_cost
    @ave_mpg = Trip.average_mpg
  end

  def show
  end
end
