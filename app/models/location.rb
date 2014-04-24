class Location < ActiveRecord::Base
  belongs_to :market
  belongs_to :merchant
  has_many :checkins
  validates :minor, uniqueness: { scope: :major }

  def self.for_beacon!(attrs)
    find_by!(
      major: attrs[:major].to_s,
      minor: attrs[:minor].to_s
    )
  end
end
