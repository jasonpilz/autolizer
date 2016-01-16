require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  should belong_to :user
end
