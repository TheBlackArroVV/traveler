FactoryBot.define do
  factory :city do
    name { 'MyString' }
    association :country, factory: :country
  end
end
