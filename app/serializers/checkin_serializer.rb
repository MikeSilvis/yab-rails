class CheckinSerializer < ActiveModel::Serializer
  attributes :id
  has_one :location
  has_one :merchant
  has_one :user
end
