class Vehicle
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def service
    AutomaticService.new(user.oauth_access_token)
  end

  def all
    service.vehicles.map { |vehicle| build_object(vehicle) }
  end

  private

    def build_object(data)
      OpenStruct.new(data)
    end
end
