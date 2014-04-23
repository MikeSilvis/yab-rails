FactoryGirl.define do
  factory :reward do
    name "Free Coffeeee!"
    sequence(:points)  { |n| n }
  end
end
