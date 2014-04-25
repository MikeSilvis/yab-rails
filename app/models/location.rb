class Location < ActiveRecord::Base
  belongs_to :market
  belongs_to :merchant
  has_many :checkins
  validates :minor, uniqueness: { scope: :major }
  before_save :set_lat_lng
  acts_as_mappable default_units: :miles,
                   default_formula: :sphere,
                   distance_field_name: :distance,
                   lat_column_name: :latitude,
                   lng_column_name: :longitude

  def self.for_beacon!(attrs)
    find_by!(
      major: attrs[:major].to_s,
      minor: attrs[:minor].to_s
    )
  end

  private

  def set_lat_lng
    if street_changed? || city_changed?
      Geokit::Geocoders::GoogleGeocoder.geocode("#{street}, #{city}, #{state}").tap do |geo|
        self.latitude   = geo.lat
        self.longitude  = geo.lng
      end
    end
  end
end
