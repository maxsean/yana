FactoryGirl.define do
  factory :survey do
    sequence(:title) { |n| "survey#{n}" }
    sequence(:description) { |n| "description#{n}" }
  end
end
