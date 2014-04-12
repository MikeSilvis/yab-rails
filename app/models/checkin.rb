class Checkin < ActiveRecord::Base
  belongs_to :location
  belongs_to :merchant
  belongs_to :user

  validates :location, presence: true
  validates :merchant, presence: true
  validates :user, presence: true
end
