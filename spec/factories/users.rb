FactoryBot.define do
  sequence(:email) { |n| "test#{n}@mail.com" }

  factory :user do
    email
    password "password"
  end
end
