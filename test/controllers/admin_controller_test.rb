require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end
