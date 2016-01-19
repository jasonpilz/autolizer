class VehicleService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def service
    AutomaticService.new(user.oauth_access_token)
  end

  def all
    vehicles.map { |vehicle| build_object(vehicle) }
  end

  def vehicles
    @vehicles ||= service.vehicles
  end

  def save_vehicles
    Vehicle.create_from_api(vehicles, user)
  end

  private

    def build_object(data)
      OpenStruct.new(data)
    end
end
