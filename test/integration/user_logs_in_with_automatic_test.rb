require 'test_helper'

class UserLogsInWithAutomaticTest < ActionDispatch::IntegrationTest
  test "logging in" do
    VCR.use_cassette('oauth_login') do
      visit "/"
      assert_equal 200, page.status_code

      click_link('automatic-button')
      assert_equal "/dashboard", current_path
      assert page.has_link?("LOGOUT")
      assert page.has_content?("VEHICLES")
      assert page.has_content?("TRIPS")

      click_link("LOGOUT")
    end
  end

  test "logging out" do
    VCR.use_cassette('oauth_logout') do
      login_user
      assert_equal 200, page.status_code

      click_link("LOGOUT")
      assert_equal "/", current_path
      refute page.has_content?("2012")
      refute page.has_content?("Odyssey")
      refute page.has_link?("LOGOUT")
    end
  end
end
