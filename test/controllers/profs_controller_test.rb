require "test_helper"

class ProfsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get profs_edit_url
    assert_response :success
  end
end
