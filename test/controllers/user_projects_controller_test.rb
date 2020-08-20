require 'test_helper'

class UserProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_projects_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_projects_destroy_url
    assert_response :success
  end

end
