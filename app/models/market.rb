class Market < ActiveRecord::Base
  has_many :users
  has_many :locations

  def slug=(value)
    self[:slug] = value.parameterize
  end
end
