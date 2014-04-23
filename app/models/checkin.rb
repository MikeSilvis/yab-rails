class Checkin < ActiveRecord::Base
  belongs_to :location
  belongs_to :merchant
  belongs_to :user

  validates :location, presence: true
  validates :merchant, presence: true
  validates :user, presence: true

  def points
    @points ||= user.checkins.where(merchant: merchant).count * 5
  end

  def next_reward
    @next_reward ||= merchant.rewards.next(points)
  end

  def next_reward_points
    next_reward.try(:points) || 0
  end
end
