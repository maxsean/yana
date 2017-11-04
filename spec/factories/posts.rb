FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "post#{n}" }
    sequence(:body) { |n| "post body #{n}" }
  end
end
