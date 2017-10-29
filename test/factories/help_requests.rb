FactoryBot.define do
  factory :help_request do
    title { Faker::Lorem.words.join(' ') }
    description { Faker::Lorem.paragraph(10) }
    association :author, factory: :user
    state 'active'

    factory :help_request_with_rescuers do
      after(:create) do |request|
        3.times { request.rescuers << FactoryBot.create(:user) }
      end
    end
  end
end
