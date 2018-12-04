FactoryBot.define do
  factory :sight do
    name { 'MyString' }
    description { 'MyString' }
    association :city, factory: :city
  end
end
