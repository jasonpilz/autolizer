require 'test_helper'

class UserLogsInWithAutomaticTest < ActionDispatch::IntegrationTest

  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code

    click_link('automatic-button')
    assert_equal "/dashboard", current_path
    assert page.has_link?("Logout")
  end
end
