require "test_helper"

class DislikesControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get dislikes_list_url
    assert_response :success
  end
end
