require "test_helper"

class TapiporlaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tapiporla_index_url
    assert_response :success
  end

  test "should get show" do
    get tapiporla_show_url
    assert_response :success
  end

  test "should get delete" do
    get tapiporla_delete_url
    assert_response :success
  end

  test "should get update" do
    get tapiporla_update_url
    assert_response :success
  end
end
