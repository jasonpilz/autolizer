require 'test_helper'

class VehiclesControllerTest < ActionController::TestCase
  test "should get index" do
    set_current_user

    get :index
    assert_response :success
  end
end
