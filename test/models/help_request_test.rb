require 'test_helper'

class HelpRequestTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_presence_of(:description)
  should validate_presence_of(:author)
  should validate_presence_of(:state)
  should belong_to(:author)
  should have_and_belong_to_many(:rescuers)

  test 'active should display valid only active requests' do
    2.times { FactoryBot.create(:help_request, state: 'active') }
    3.times { FactoryBot.create(:help_request, state: 'completed') }
    assert_equal 2, HelpRequest.active.count
  end
end
