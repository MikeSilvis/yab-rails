FactoryGirl.define do
  factory :location do
    sequence(:uuid)  { |n| "UUID-STRING-#{n}" }
    sequence(:identifier)  { |n| "Yab.Yab.#{n}" }
    sequence(:major)  { |n| n.to_s }
    sequence(:minor)  { |n| n.to_s }
    city Faker::Address.city
    street Faker::Address.street_name
    zipcode Faker::Address.zip_code
    message Faker::Lorem.sentence
    latitude Faker::Address.latitude
    longitude Faker::Address.longitude
  end
end
