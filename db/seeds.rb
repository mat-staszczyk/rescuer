HelpRequest.destroy_all
User.destroy_all
puts "Destroyed all users and help requests"

help_requests = [
  'Pomoc w naprawie roweru',
  'Wniesienie kanapy na 4 piętro',
  'Malowanie pokoju',
  'Pomoc w dotarciu na pogrzeb'
]
help_requests.each do |request|
  FactoryBot.create(:help_request, title: request, state: 'active')
end
puts "#{help_requests.count} standalone help requests created"

FactoryBot.create(:help_request_with_rescuers, title: 'Organizacja lokalnego kiermaszu', state: 'active')
puts "Help request with rescuers created"
