class VenueSerializer < ActiveModel::Serializer
  attributes :id, :name, :longitude, :latitude, :street, :state, :country
end
