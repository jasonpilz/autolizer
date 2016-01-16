require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_many :vehicles

  def setup
    @auth_info = { "provider" => "automatic",
                   "uid" => "werutuwerptupoi",
                   "info" => { "id" => "asdfasdfads",
                               "first_name" => "Jason",
                               "last_name" => "Pilz",
                               "email" => "jasonpilz@gmail.com" },
                   "credentials" => { "token" => "adsfasdfasdfasdsaf",
                                      "expires_at" => 3434343,
                                      "expires" => true },
                   "extra" => {} }
  end

  test "should be created from omniauth hash" do
    User.from_omniauth(@auth_info)
    jason = User.last

    assert_equal User, jason.class
    assert_equal "adsfasdfasdfasdsaf",  jason.oauth_access_token
    assert_equal "Jason",               jason.first_name
    assert_equal "Pilz",                jason.last_name
    assert_equal "jasonpilz@gmail.com", jason.email
    assert_equal 3434343,               jason.token_expires_at
    assert_equal "asdfasdfads",         jason.uid
  end
end
