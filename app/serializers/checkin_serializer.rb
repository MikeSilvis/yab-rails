class CheckinSerializer < ActiveModel::Serializer
  attributes :id,
             :message,
             :level

  has_one :merchant
  has_one :user

  def level
    {
      earned: 5,
      points: object.points,
      next: object.next_reward_points
    }
  end

  def message
    object.location.message
  end
end
