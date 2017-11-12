FactoryGirl.define do
  factory :question do
    sequence(:body) { |n| "body#{n}" }
    sequence(:short) { |n| "short#{n}" }
  end
end
