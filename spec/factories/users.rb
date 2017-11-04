FactoryGirl.define do
  factory :user do
    sequence(:handle) { |n| "test#{n}" }
    sequence(:email) { |n| "user#{n}@test.com" }
    password "123456"
    password_confirmation "123456"
  end
end
