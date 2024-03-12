require "test_helper"

class CourtsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get courts_index_url
    assert_response :success
  end

  test "should get show" do
    get courts_show_url
    assert_response :success
  end

  test "should get new" do
    get courts_new_url
    assert_response :success
  end

  test "should get edit" do
    get courts_edit_url
    assert_response :success
  end

  test "should get create" do
    get courts_create_url
    assert_response :success
  end

  test "should get update" do
    get courts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get courts_destroy_url
    assert_response :success
  end
end
