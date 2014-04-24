FactoryGirl.define do
  factory :location do
    sequence(:uuid)  { |n| "UUID-STRING-#{n}" }
    sequence(:identifier)  { |n| "Yab.Yab.#{n}" }
    sequence(:major)  { |n| n.to_s }
    sequence(:minor)  { |n| n.to_s }
  end
end
