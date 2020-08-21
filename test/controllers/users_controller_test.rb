require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get joining" do
    get users_joining_url
    assert_response :success
  end

end
