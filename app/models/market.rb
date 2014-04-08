class Market < ActiveRecord::Base
  has_many :users
  has_many :locations
  store_accessor :preferences, :show_greek

  def slug=(value)
    self[:slug] = value.parameterize
  end

  def show_greek?
   @show_greek ||= YAML.load(show_greek.to_s)
  end

end
