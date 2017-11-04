FactoryGirl.define do
  factory :comment do
    sequence(:body) { |n| "comment#{n}" }
  end
end
