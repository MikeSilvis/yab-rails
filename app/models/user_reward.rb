class UserReward < ActiveRecord::Base
  belongs_to :user
  belongs_to :reward
  belongs_to :merchant

  validates :user, uniqueness: { scope: :merchant }

  def points
    checkins_count * Checkin::POINT_VALUE
  end
end
