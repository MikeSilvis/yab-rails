class Location < ActiveRecord::Base
  belongs_to :locationable, polymorphic: true
  acts_as_mappable lat_column_name: 'latitude', lng_column_name: 'longitude'

  ONE_HUNDRED_FEET = 0.0189394

  def self.within_range(lat, lng)
    within(ONE_HUNDRED_FEET, origin: [lat, lng])
  end
end
