class MerchantSerializer < ActiveModel::Serializer
  attributes :id, :name, :photo
  has_many :locations
  has_many :rewards

  def photo
    object.avatar.thumb('200x200#').url if object.avatar
  end
end
