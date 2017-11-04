FactoryGirl.define do
  factory :forum do
    sequence(:name) { |n| "forum#{n}" }
    sequence(:description) { |n| "forum description #{n}" }
  end
end
