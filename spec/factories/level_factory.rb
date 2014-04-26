FactoryGirl.define do
  factory :level do
    sequence(:points)  { |n| n * 5 }
    name Faker::Name.title
  end
end
