class MerchantSerializer < ActiveModel::Serializer
  attributes :id, :name, :avatar_url
  has_many :locations
  has_many :rewards

  def attributes
    super.tap do |hash|
      if object.for_user
        hash[:level] = level
      end
    end
  end

  def avatar_url
    object.avatar.thumb('200x200#').url if object.avatar
  end

  def level
    {
      points: points,
      next: next_reward
    }
  end

  def points
    object.for_user.checkins.where(merchant: object).count * 5
  end

  def next_reward
    object.rewards.next(points).try(:points) || 0
  end
end
