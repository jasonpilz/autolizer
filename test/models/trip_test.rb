require 'test_helper'

class TripTest < ActiveSupport::TestCase
  should belong_to :vehicle

  def setup
    @data = [ { :average_from_epa_kmpl => 7.7,
                :average_kmpl          => 6.5,
                :vehicle               => "MyString",
                :url                   => "MyString",
                :started_at            => "2016-01-14T18:19:45.600000Z",
                :start_timezone        => "Denver/America",
                :fuel_cost_usd         => 0.05,
                :fuel_volume_l         => 1.3,
                :id                    => "T_e7112e6f0ed6840c",
                :distance_m            => 11860.9,
                :ended_at              => "2016-01-14T18:35:51.200000Z",
                :end_timezone          => "Denver/America",
                :user_url              => "https://api.automatic.com/user/U_66bd7351501dae06/",
                :idling_time_s         => 0,
                :duration_s            => 965.5,
                :path                  => "kyzrFpzo~RvBwDXZZ^l@p@FP?@BLd@KPEJ?NFvCbDLLDGr@wAn@iAbAhAxA~",
                :start_address         => { :name => "17800-17898 E 107th Way, Commerce City, CO 80022, USA" },
                :end_address           => { :name => "3498 Eagle Boulevard, Brighton, CO 80601, USA" },
                :start_location        => { :lon  => -104.77997,
                                            :lat  => 39.84738 },
                :end_location          => { :lon  => 39.95709,
                                            :lat  => -84.3423 } } ]
  end

  test "can be created from api data" do
    Trip.create_from_api(@data)

    trip = Trip.last

    assert_equal "T_e7112e6f0ed6840c", trip.tid
    assert_equal 6.5,                  trip.average_kmpl
    assert_equal 965.5,                trip.duration_s
  end
end
