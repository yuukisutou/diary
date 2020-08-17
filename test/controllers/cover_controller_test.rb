require 'test_helper'

class CoverControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get cover_home_url
    assert_response :success
  end

end
