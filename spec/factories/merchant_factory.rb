FactoryGirl.define do
  factory :merchant do
    sequence(:name)  { |n| "Shandygaff #{n}" }
  end
end
