FactoryBot.define do
  factory :trip do
    budget { 100 }
    max_members { 10 }
    description { 'description' }
    association :city, factory: :city
    association :user, factory: :user
  end
end
