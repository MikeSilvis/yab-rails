FactoryGirl.define do
  factory :market do
    sequence(:name)  { |n| "Penn State #{n}" }
    sequence(:slug)  { |n| "Penn-State-#{n}" }
  end
end
