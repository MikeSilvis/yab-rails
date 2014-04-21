class Level < ActiveRecord::Base
  include Avatar
  validates :name, presence: true
  validates :points, presence: true, uniqueness: true
end
