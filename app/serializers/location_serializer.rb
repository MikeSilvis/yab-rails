class LocationSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :street, :zipcode, :market_id
end
