FactoryBot.define do
  factory :membership do
    association :user, factory: :user
    association :trip, factory: :trip
  end
end
