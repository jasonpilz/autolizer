require 'test_helper'

class VehicleServiceTest < ActiveSupport::TestCase

  test "#all" do
    VCR.use_cassette('vehicle_service#all') do
      vehicle_service = VehicleService.new(users(:jason))
      vehicles = vehicle_service.all

      assert_equal 1, vehicles.count

      vehicles.each do |vehicle|
        assert_equal OpenStruct, vehicle.class
        assert vehicle.make
        assert vehicle.model
        assert vehicle.vin
        assert vehicle.id
      end
    end
  end

  test "#save_vehicles" do
    VCR.use_cassette('vehicle_service#save_vehicles') do
      count = Vehicle.count
      assert_equal 2, count

      vehicle_service = VehicleService.new(users(:jason))
      vehicle_service.save_vehicles

      assert_equal 3, Vehicle.count
    end
  end

end
