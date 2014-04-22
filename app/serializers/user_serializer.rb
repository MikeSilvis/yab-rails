class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :phone_number,
             :name,
             :profile_photo_url,
             :cover_photo_url,
             :facebook_id,
             :level_name,
             :level_icon_url,
             :yabs

  def attributes
    super.tap do |hash|
      hash[:authentication_token] = object.authentication_token if object == current_user
    end
  end

  def profile_photo_url
    Yab::Facebook.profile_photo(object.facebook_id)
  end

  def cover_photo_url
    Yab::Facebook.cover_photo(object.facebook_id)['source']
  end

  include ActionView::Helpers::NumberHelper
  def yabs
    number_with_delimiter object.yabs
  end

  def level_name
    object.current_level.name if object.current_level
  end

  include ActionView::Helpers::AssetTagHelper
  def level_icon_url
    object.current_level.thumb_url('40x40!') if object.current_level
  end
end
