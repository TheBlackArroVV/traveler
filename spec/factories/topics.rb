FactoryBot.define do
  factory :topic do
    title { 'MyString' }
    description { 'MyString' }
    association :user, factory: :user
  end
end
