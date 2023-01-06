require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get likes_list_url
    assert_response :success
  end
end
