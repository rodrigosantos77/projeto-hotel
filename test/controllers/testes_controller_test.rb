require "test_helper"

class TestesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get testes_index_url
    assert_response :success
  end
end
