FactoryBot.define do
  factory :user do
    first_name 'John'
    last_name 'Malkovic'
    sequence :email { |n| "email#{n}@email.com" }
    password 'password'
    password_confirmation 'password'
    confirmed_at Time.zone.now - 1.hour
    confirmation_sent_at Time.zone.now - 2.hours
  end
end
