class TripSaveWorker
  include Sidekiq::Worker

  def perform(user_id)
    current_user = User.find(user_id)
    trip_service = TripService.new(current_user)
    trip_service.save_trips
  end
end
