class Checkin < ActiveRecord::Base
  POINT_VALUE = 5
  belongs_to :location
  belongs_to :merchant
  belongs_to :user, counter_cache: true
  after_save :update_user_level

  validates :location, presence: true
  validates :merchant, presence: true
  validates :user, presence: true

  def points
    @points ||= user.checkins.where(merchant: merchant).count * POINT_VALUE
  end

  def next_reward
    @next_reward ||= merchant.rewards.next(points)
  end

  def current_reward
    @current_reward ||= merchant.rewards.current(points)
  end

  def next_reward_points
    next_reward.try(:points) || 0
  end

  private

  def update_user_level
    user.tap do |u|
      u.current_level = Level.current(user.calculate_points)
      u.next_level = Level.next(user.calculate_points)
      u.user_rewards.where(merchant: merchant).first_or_initialize do |ur|
        ur.reward = current_reward
        ur.save!
      end
      u.save!
    end
  end
end
