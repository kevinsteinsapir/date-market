require "test_helper"

class DatexesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get datexes_index_url
    assert_response :success
  end

  test "should get show" do
    get datexes_show_url
    assert_response :success
  end

  test "should get new" do
    get datexes_new_url
    assert_response :success
  end

  test "should get create" do
    get datexes_create_url
    assert_response :success
  end

  test "should get edit" do
    get datexes_edit_url
    assert_response :success
  end

  test "should get update" do
    get datexes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get datexes_destroy_url
    assert_response :success
  end
end
