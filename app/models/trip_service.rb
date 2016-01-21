class TripService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def service
    AutomaticService.new(user.oauth_access_token)
  end

  def all
    trips.map { |trip| build_object(trip) }
  end

  def trips
    @trips ||= service.trips
  end

  def save_trips
    Trip.create_from_api(trips)
  end

  private

    def build_object(data)
      OpenStruct.new(data)
    end
end

