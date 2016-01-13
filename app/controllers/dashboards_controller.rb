class DashboardsController < ApplicationController
  def index
    @vehicles = Vehicle.new(current_user).all
    @last_trip = Trip.new(current_user).last
  end
end
