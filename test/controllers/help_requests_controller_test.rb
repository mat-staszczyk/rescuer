require 'test_helper'

class HelpRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @draft_request = FactoryBot.create(:help_request)
    @active_request = FactoryBot.create(:help_request, state: 'active')
    @cancelled_request = FactoryBot.create(:help_request, state: 'cancelled')
    @completed_request = FactoryBot.create(:help_request, state: 'completed')
  end

  test "should get show" do
    login_as @draft_request.author
    get help_request_url(@draft_request)
    assert_response :success
  end

  test "should get edit" do
    login_as @draft_request.author
    get edit_help_request_url(@draft_request)
    assert_response :success
  end

  test "should create a help request" do
    login_as @draft_request.author
    assert_difference 'HelpRequest.count' do
      post help_requests_url, params: { help_request: { title: 'Title', description: 'A sample description', author_id: @draft_request.author.id } }
    end
    assert_redirected_to help_request_url(HelpRequest.last)
  end

  test "should activate a help request" do
    login_as @draft_request.author
    get activate_help_request_url(@draft_request)
    assert_redirected_to help_request_url(@draft_request)
    assert_nil(flash[:alert])
    assert_equal('Prośba o pomoc została aktywowana.', flash[:notice])
    assert_equal('active', @draft_request.reload.state)
  end

  test "should cancel a help request" do
    login_as @active_request.author
    get cancel_help_request_url(@active_request)
    assert_redirected_to help_request_url(@active_request)
    assert_nil(flash[:alert])
    assert_equal('Prośba o pomoc została anulowana.', flash[:notice])
    assert_equal('cancelled', @active_request.reload.state)
  end

  test "should complete a help request" do
    login_as @active_request.author
    get complete_help_request_url(@active_request)
    assert_redirected_to help_request_url(@active_request)
    assert_nil(flash[:alert])
    assert_equal('Prośba o pomoc została ukończona.', flash[:notice])
    assert_equal('completed', @active_request.reload.state)
  end

  test "should follow a help request" do
    login_as @draft_request.author
    assert_difference '@active_request.rescuers.count' do
      get follow_help_request_url(@active_request)
      assert_redirected_to help_request_url(@active_request)
      assert_nil(flash[:alert])
      assert_equal('Dziękujemy za pomoc!', flash[:notice])
    end
  end
end
