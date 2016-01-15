class DashboardsController < ApplicationController
  def index
    vehicle_service = VehicleService.new(current_user)
    @vehicles = vehicle_service.all
    vehicle_service.save_vehicles
    @last_trip = Trip.new(current_user).last
  end
end
