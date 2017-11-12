FactoryGirl.define do
  factory :choice do
    sequence(:body) { |n| "survey#{n}" }
    sequence(:short) { |n| "description#{n}" }
  end
end
