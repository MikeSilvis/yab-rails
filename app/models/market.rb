class Market < ActiveRecord::Base
  has_many :users
  has_many :locations
  has_many :merchants, through: :locations
  store_accessor :preferences, :beta

  def slug=(value)
    self[:slug] = value.parameterize
  end

  def beta?
    @beta ||= YAML.load(beta.to_s)
  end

  def beta
    preferences['beta'] || false
  end

  def preferences
    self[:preferences] || {}
  end
end
