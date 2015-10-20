require 'test_helper'

class UserControllerTest < ActionController::TestCase
	def setup
  		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "sdf")
	end
  # test "the truth" do
  #   assert true
  # end
end
