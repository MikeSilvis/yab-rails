class Location < ActiveRecord::Base
  belongs_to :market
  belongs_to :merchant

  def self.for_beacon(attrs)
    find_by(uuid: attrs[:uuid], identifier: attrs[:identifier])
  end
end
