class Location < ActiveRecord::Base
  belongs_to :market
  belongs_to :merchant
  has_many :checkins

  def self.for_beacon!(attrs)
    find_by!(
      uuid: attrs[:uuid],
      identifier: attrs[:identifier],
      major: attrs[:major],
      minor: attrs[:minor]
    )
  end
end
