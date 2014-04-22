class MerchantSerializer < ActiveModel::Serializer
  attributes :id, :name, :avatar_url
  has_many :locations
  has_many :rewards

  def avatar_url
    object.avatar.thumb('200x200#').url if object.avatar
  end
end
