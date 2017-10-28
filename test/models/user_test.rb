require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:email)
  should validate_presence_of(:password)
  should validate_length_of(:first_name).is_at_most(50)
  should validate_length_of(:last_name).is_at_most(75)
  should validate_length_of(:email).is_at_most(255)
  should validate_length_of(:password).is_at_least(8)
end
