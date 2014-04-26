FactoryGirl.define do
  factory :merchant do
    sequence(:name)  { |n| Faker::Company.name }
    user
  end
end
