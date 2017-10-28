FactoryBot.define do
  factory :help_request do
    title "Monster alert"
    description "Monster alert"
    association :author, factory: :user
    
    factory :help_request_with_rescuers do
      after(:create) do |request|
        3.times { request.rescuers << FactoryBot.create(:user) } 
      end
    end
  end
end
