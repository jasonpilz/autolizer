class VehicleSaveWorker
  include Sidekiq::Worker

  def perform(user_id)
    current_user = User.find(user_id)
    vehicle_service = VehicleService.new(current_user)
    vehicle_service.save_vehicles
  end
end
