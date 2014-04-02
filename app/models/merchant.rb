class Merchant < ActiveRecord::Base
  has_many :locations, as: :locationable
  has_many :users
  accepts_nested_attributes_for :locations, allow_destroy: true
  accepts_nested_attributes_for :users, allow_destroy: true
end
