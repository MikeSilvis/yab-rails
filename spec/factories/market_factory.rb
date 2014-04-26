FactoryGirl.define do
  factory :market do
    sequence(:name)  { |n| "Penn State #{n}" }
    sequence(:slug)  { |n| "penn-state-#{n}" }
  end
end
