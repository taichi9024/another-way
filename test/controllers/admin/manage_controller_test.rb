require "test_helper"

class Admin::ManageControllerTest < ActionDispatch::IntegrationTest
  test "should get user" do
    get admin_manage_user_url
    assert_response :success
  end
end
