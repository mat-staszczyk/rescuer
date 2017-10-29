HelpRequest.destroy_all
User.destroy_all
puts "Destroyed all users and help requests"
FactoryBot.create(:help_request_with_rescuers)
puts "Help request with rescuers created"
3.times { FactoryBot.create(:help_request) }
puts "3 standalone help requests created"
