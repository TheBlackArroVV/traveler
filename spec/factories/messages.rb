FactoryBot.define do
  factory :message do
    text { 'MyString' }
    association :user, factory: :user
    association :topic, factory: :topic
  end
end
