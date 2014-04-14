FactoryGirl.define do
  factory :merchant do
    sequence(:name)  { |n| "Shandygaff #{n}" }
    user
  end
end
