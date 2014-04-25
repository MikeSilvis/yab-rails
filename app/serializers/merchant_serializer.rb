class MerchantSerializer < ActiveModel::Serializer
  attributes :id, :name, :avatar_url, :overall_level
  has_many :locations
  has_many :rewards
  has_many :users

  def users
    object.users.distinct
  end

  def attributes
    super.tap do |hash|
      hash[:user_level] = user_level if object.for_user
    end
  end

  def avatar_url
    object.avatar.thumb('200x200#').url if object.avatar
  end

  def overall_level
    {
      points: object.points,
      next: object.next_level_points,
      icon_url: object.level_icon_url,
      name: object.level_name
    }
  end

  def user_level
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
