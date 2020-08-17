require 'test_helper'

class NegativeEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get negative_events_new_url
    assert_response :success
  end

end
