ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  def sign_in_as(name)
    post login_url, params: { user: { email: users(name).email, password: "admin123456" } }
  end
  # Add more helper methods to be used by all tests here...
end
