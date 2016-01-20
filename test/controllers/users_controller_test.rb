require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get current" do
    get :current

    assert_response :success
  end

  test "should return json for current user" do
    set_current_user
    response = get :current
    user = response.body

    parsed_user = JSON.parse(user)

    assert_equal String, user.class
    assert_equal "Jason", parsed_user["first_name"]
    assert_equal "Pilz", parsed_user["last_name"]
    assert_equal "Pilz", parsed_user["last_name"]
    assert_equal "jasonpilz@gmail.com", parsed_user["email"]
  end
end
