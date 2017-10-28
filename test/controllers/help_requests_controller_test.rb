require 'test_helper'

class HelpRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get help_requests_index_url
    assert_response :success
  end

  test "should get show" do
    get help_requests_show_url
    assert_response :success
  end

  test "should get edit" do
    get help_requests_edit_url
    assert_response :success
  end

  test "should get create" do
    get help_requests_create_url
    assert_response :success
  end

end
