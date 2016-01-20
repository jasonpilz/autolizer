require 'test_helper'

class UserCanViewVehicleStatsTest <
  include Capybara::DSL

  # setup do
  #   Capybara.current_driver = Capybara.javascript_driver # :selenium by default
  # end

  # test "can view current stats for vehicle" do

  #   session[:user_id] = users(:jason).id
  #   visit "/dashboard"

  #   assert page.has_content?("2012 Odyssey")
  #   session.delete(:user_id)
  # end
end
