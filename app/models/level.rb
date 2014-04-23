class Level < ActiveRecord::Base
  include Avatar
  validates :name, presence: true
  validates :points, presence: true, uniqueness: true

  def self.current(yabs)
    where('points <= ?', yabs).order(points: :desc).first
  end

  def self.next(yabs)
    where('points > ?', yabs).order(points: :asc).first || max(yabs)
  end

  def self.max(yabs)
    find_by(points: yabs)
  end
end
