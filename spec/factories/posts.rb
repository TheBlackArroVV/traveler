FactoryBot.define do
  factory :post do
    title 'MyString'
    body 'MyString'
    association :user, factory: :user
  end
end
