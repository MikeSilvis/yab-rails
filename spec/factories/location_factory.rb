FactoryGirl.define do
  factory :location do
    sequence(:uuid)  { |n| "UUID-STRING-#{n}" }
    sequence(:identifier)  { |n| "Yab.Yab.#{n}" }
  end
end
