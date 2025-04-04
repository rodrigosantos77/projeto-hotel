require "test_helper"

class QuartosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quartos_index_url
    assert_response :success
  end

  test "should get show" do
    get quartos_show_url
    assert_response :success
  end
end
