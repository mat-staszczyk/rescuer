require 'test_helper'

class HelpRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @help_request = FactoryBot.create(:help_request)
    @user = @help_request.author
  end

  test "should get index" do
    get help_requests_url
    assert_response :success
  end

  test "should get show" do
    get help_request_url(@help_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_help_request_url(@help_request)
    assert_response :success
  end

  test "should create a help request" do
    login_as @user
    assert_difference 'HelpRequest.count' do
      post help_requests_url, params: { help_request: { title: 'Title', description: 'A sample description', author_id: @user.id } }
    end
    assert_redirected_to help_request_url(HelpRequest.last)
  end

end
