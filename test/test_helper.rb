ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'simplecov'
require 'minitest/pride'
require 'mocha/mini_test'
require 'mrspec'
require 'webmock'
require 'vcr'

SimpleCov.start("rails")

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  VCR.configure do |config|
    config.cassette_library_dir = "test/cassettes"
    config.hook_into :webmock
  end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.app = Autolizer::Application
    stub_omniauth
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:automatic] = OmniAuth::AuthHash.new({
      provider: 'automatic',
      uid: '8323d4512e9eb0e45c77',
      info: {
        id: "U_66bd7351501dae06",
        first_name: "Jason",
        last_name: "Pilz",
        email: "jasonpilz@gmail.com"
      },
      credentials: {
        token: ENV['AUTOMATIC_TEST_ACCESS_TOKEN'],
        expires_at: 1483833599,
        expires: true
      }
    })
  end

  def login_user
    visit "/"
    click_link('automatic-button')
  end
end


DatabaseCleaner.strategy = :transaction

class Minitest::Spec
  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end
