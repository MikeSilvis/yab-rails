FactoryGirl.define do
  factory :user do
    sequence(:email)  { |n| "mike#{n}@getyab.com" }
    sequence(:name)  { |n| "John Doe #{n}" }
    admin false
  end

  factory :admin, class: User do
    sequence(:name)  { |n| "Admin Doe #{n}" }
    admin      true
  end
end
