class Location < ActiveRecord::Base
  belongs_to :market
  belongs_to :merchant
  acts_as_mappable lat_column_name: 'latitude', lng_column_name: 'longitude'

  def self.for_beacon(attrs)
    find_by(uuid: attrs[:uuid], identifier: attrs[:identifier])
  end
end
