class Merchant < ActiveRecord::Base
  has_many :locations, as: :locationable
end
