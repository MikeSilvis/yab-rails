class Location < ActiveRecord::Base
  acts_as_mappable lat_column_name: 'latitude', lng_column_name: 'longitude'

  ONE_HUNDRED_FEET = 0.0189394

  def self.within_range(lat, lng)
    within(ONE_HUNDRED_FEET, origin: [lat, lng])
  end
end
