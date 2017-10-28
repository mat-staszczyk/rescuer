FactoryBot.define do
  factory :user do
    first_name 'John'
    last_name 'Malkovic'
    birth_date Faker::Date.birthday(18, 65)
    sequence :email { |n| "email#{n}@email.com" }
    password 'password'
    password_confirmation 'password'
  end
end
