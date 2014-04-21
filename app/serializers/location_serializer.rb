class LocationSerializer < ActiveModel::Serializer
  attributes :id, :street, :zipcode, :state, :city, :market_id
end
