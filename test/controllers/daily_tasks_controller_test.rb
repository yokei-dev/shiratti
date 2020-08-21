require 'test_helper'

class DailyTasksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get daily_tasks_create_url
    assert_response :success
  end

end
