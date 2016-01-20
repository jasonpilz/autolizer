require 'test_helper'

class ApplicationHelperTest < ActiveSupport::TestCase
  include ApplicationHelper

  test "#full_title returns base title for page with to title" do
    title = full_title

    assert_equal "Autolizer", title
  end

  test "#full_title returns concatenated title with base and provided title" do
    full_title = full_title("Dashboard")

    assert_equal "Dashboard | Autolizer", full_title
  end
end

