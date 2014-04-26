class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :phone_number,
             :name,
             :avatar_url,
             :cover_photo_url,
             :facebook_id,
             :level

  has_many :user_rewards
  #has_many :merchants
  #has_many :checkins

  #def merchants
    #object.merchants
  #end

  def attributes
    super.tap do |hash|
      hash[:authentication_token] = object.authentication_token if object == current_user
    end
  end

  def level
    {
      points: object.points,
      next: object.next_level_points,
      icon_url: object.level_icon_url,
      name: object.level_name,
    }
  end

  def avatar_url
    Yab::Facebook.profile_photo(object.facebook_id)
  end

  def cover_photo_url
    Yab::Facebook.cover_photo(object.facebook_id)['source']
  end
end
