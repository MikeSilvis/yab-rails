class CheckinSerializer < ActiveModel::Serializer
  attributes :id, :message
  has_one :location
  has_one :merchant
  has_one :user

  def message
    'BOOBS'
  end
end
