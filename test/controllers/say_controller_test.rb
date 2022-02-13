require "test_helper"

class SayControllerTest < ActionDispatch::IntegrationTest
  test "should get movie" do
    get say_movie_url
    assert_response :success
  end
end
