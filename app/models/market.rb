class Market < ActiveRecord::Base
  has_many :users
  has_many :locations
  has_many :merchants, through: :locations
  store_accessor :preferences

  def slug=(value)
    self[:slug] = value.parameterize
  end
end
