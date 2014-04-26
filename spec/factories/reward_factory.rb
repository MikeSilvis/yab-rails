FactoryGirl.define do
  factory :reward do
    name "Free Coffeeee!"
    sequence(:points)  { |n| n * 5 }
  end
end
