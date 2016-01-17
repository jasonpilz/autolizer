class Trip
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def service
    AutomaticService.new(user.oauth_access_token)
  end

  def all
    service.trips.map { |trip| build_object(trip) }
  end

  def last
    build_object(service.trips.first)
  end

  private

    def build_object(data)
      OpenStruct.new(data)
    end
end
