require './test/test_helper'

class AutomaticServiceTest < ActiveSupport::TestCase
  attr_reader :service

  def setup
    @service = AutomaticService.new(users(:jason).oauth_access_token)
  end

  test "#vehicles" do
    VCR.use_cassette('automatic_service#vehicles') do
      vehicles = service.vehicles
      vehicle = vehicles.first

      assert_equal 1,         vehicles.count
      assert_equal "Honda",   vehicle[:make]
      assert_equal "Odyssey", vehicle[:model]
      assert_equal 2012,      vehicle[:year]
    end
  end

  test "#trips" do
    VCR.use_cassette('automatic_service#trips') do
      trips = service.trips
      trip = trips.first

      assert_equal 10, trips.count
      assert_equal "T_94782a3b53e2f7c0", trip[:id]
      assert_equal 864.3,                trip[:duration_s]
      assert_equal 7403.2,               trip[:distance_m]
    end
  end

  test "#user" do
    VCR.use_cassette('automatic_service#user') do
      user = service.user

      assert_equal "jasonpilz@gmail.com", user[:username]
      assert_equal "U_66bd7351501dae06",  user[:id]
      assert_equal "Jason",               user[:first_name]
      assert_equal "Pilz",                user[:last_name]
    end
  end

  test "#trip" do
    VCR.use_cassette('automatic_service#trip') do
      trips = service.trips
      trip_id = trips.first[:id]

      trip = service.trip(trip_id)

      assert_equal "T_94782a3b53e2f7c0", trip[:id]
      assert_equal 0.54,                 trip[:fuel_cost_usd]
      assert_equal 150,                  trip[:idling_time_s]
    end
  end

  test "#vehicle" do
    VCR.use_cassette('automatic_service#vehicle') do
      vehicles = service.vehicles
      vehicle_id = vehicles.first[:id]

      vehicle = service.vehicle(vehicle_id)

      assert_equal "C_93c2bbd9ce020b11", vehicle[:id]
      assert_equal "Honda Odyssey",      vehicle[:display_name]
    end
  end
end
