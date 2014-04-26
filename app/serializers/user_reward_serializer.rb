class UserRewardSerializer < ActiveModel::Serializer
  attributes :id,
             :points
  has_one :merchant
  has_one :reward
end
