require 'test_helper'

class VehiclesControllerTest < ActionController::TestCase
  test "should get index" do
    set_current_user

    get :index
    assert_response :success
    assert_select "title", "Vehicles | Autolizer"
  end

  test "should get show" do
    set_current_user

    get :show, id: Vehicle.first.id

    assert_response :success
    assert_select "title", "MyString | Autolizer"
  end
end
