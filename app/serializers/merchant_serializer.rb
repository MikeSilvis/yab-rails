class MerchantSerializer < ActiveModel::Serializer
  attributes :id, :name, :avatar_url
  has_many :locations
  has_many :rewards
  #has_many :users

  def users
    object.users.distinct
  end

  def avatar_url
    object.avatar.thumb('200x200#').url if object.avatar
  end
end
