class Level < ActiveRecord::Base
  include Avatar
  include Achievement
  validates :name, presence: true
  validates :points, presence: true, uniqueness: true
end
