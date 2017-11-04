FactoryGirl.define do
  factory :illness do
    sequence(:name) { |n| "illness#{n}" }
    sequence(:description) { |n| "illness description #{n}" }
  end
end
