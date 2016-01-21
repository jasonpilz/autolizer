require 'test_helper'

class TripsControllerTest < ActionController::TestCase
  test "should get index" do
    set_current_user

    get :index

    assert_response :success
    assert_select "title", "Trips | Autolizer"
  end

  test "should get show" do
    set_current_user

    get :show, id: Trip.first.id

    assert_response :success
  end

end
