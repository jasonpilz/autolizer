require 'test_helper'

class TripServiceTest < ActiveSupport::TestCase

  test "#all" do
    VCR.use_cassette('trip_service#all') do
      trip_service = TripService.new(users(:jason))
      trips = trip_service.all

      assert_equal 10, trips.count

      trips.each do |trip|
        assert_equal OpenStruct, trip.class
        assert trip.average_kmpl
        assert trip.path
        assert trip.duration_s
        assert trip.distance_m
      end
    end
  end
end
