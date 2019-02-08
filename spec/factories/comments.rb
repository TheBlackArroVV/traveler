FactoryBot.define do
  factory :comment do
    body { 'comment' }
    user
    post
  end
end
