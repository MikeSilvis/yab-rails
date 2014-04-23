class CheckinSerializer < ActiveModel::Serializer
  attributes :id, :message, :points, :next_level_points
  has_one :location
  has_one :merchant
  has_one :user

  def message
    location.message
  end

  def points
    5
  end
end
