require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  should belong_to :user

  def setup
    @data = [ { :created_at         => "2016-01-08T20:51:17.249000Z",
                :display_name       => "Honda Odyssey",
                :fuel_grade         => "regular",
                :id                 => "C_93c2bbd9ce020b11",
                :make               => "Honda",
                :submodel           => "EX",
                :fuel_level_percent => 83.98,
                :year               => 2012,
                :updated_at         => "2016-01-10T23:25:54.264000Z",
                :active_dtcs        => [],
                :vin                => "23456789asdfasdf",
                :model              => "Odyssey",
                :url                => "https://api.automatic.com/vehicle/C_93c2bbd9ce020b11/" } ]
  end

  test "can be created from api data" do
    Vehicle.create_from_api(@data, users(:jason))

    vehicle = Vehicle.last

    assert_equal "23456789asdfasdf",   vehicle.vin
    assert_equal "C_93c2bbd9ce020b11", vehicle.vid
    assert_equal 2012,                 vehicle.year
    assert_equal "EX",                 vehicle.submodel
    assert_equal "Odyssey",            vehicle.model
  end
end
