require 'test_helper'

class HelpRequestTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_presence_of(:description)
  should validate_presence_of(:author)
  should belong_to(:author)
  should have_and_belong_to_many(:rescuers)
end
