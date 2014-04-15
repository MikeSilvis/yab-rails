class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :phone_number,
             :name,
             :profile_photo_url,
             :cover_photo_url,
             :cover_photo_offset,
             :facebook_id

  def attributes
    super.tap do |hash|
      hash[:authentication_token] = object.authentication_token if object == current_user
    end
  end

  def profile_photo_url
    Yab::Facebook.profile_photo(object.facebook_id)
  end

  def cover_photo_url
    cover_photo['source']
  end

  def cover_photo_offset
    cover_photo['offset_y']
  end

  private

  def cover_photo
    Yab::Facebook.cover_photo(object.facebook_id)
  end
end
