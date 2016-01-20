class DashboardsController < ApplicationController
  def index
    # VehicleSaveWorker.perform_async(current_user.id)
    vehicle_service = VehicleService.new(current_user)
    vehicle_service.save_vehicles
  end
end
