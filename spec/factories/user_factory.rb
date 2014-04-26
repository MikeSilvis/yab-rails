FactoryGirl.define do
  factory :user do
    sequence(:email)  { |n| Faker::Internet.email }
    sequence(:name)  { |n| Faker::Name.name }
    admin false
  end

  factory :admin, class: User do
    sequence(:email)  { |n| Faker::Internet.email }
    sequence(:name)  { |n| Faker::Name.name }
    admin      true
  end
end
