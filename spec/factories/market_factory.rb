FactoryGirl.define do
  factory :market do
    sequence(:name)  { |n| "Penn State #{n}" }
  end
end
