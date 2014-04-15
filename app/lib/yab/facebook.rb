class Yab::Facebook
  attr_accessor :access_token
  APP_SECRET = 'e186e12bf25a6ae6d339e8479d5a5644'

  def initialize(access_token)
    self.access_token = access_token
  end

  def me
    client.get_objects('me')['me'].tap do |facebook|
      facebook['birthday'] = Date.strptime(facebook['birthday'], '%m/%d/%Y')
    end
  end

  def self.cover_photo(facebook_id)
    Rails.cache.fetch("cover_photo_#{facebook_id}") do
      url = "http://graph.facebook.com/#{facebook_id}?fields=cover"
      JSON.parse(Faraday.get(url).body)['cover'].slice('source', 'offset_y')
    end
  end

  def self.profile_photo(facebook_id)
    Rails.cache.fetch("profile_photo_#{facebook_id}") do
      url = "http://graph.facebook.com/#{facebook_id}/picture?width=100&height=100"
      Faraday.get(url).headers['location']
    end
  end

  private

  def client
    @client ||= Koala::Facebook::API.new(access_token, APP_SECRET)
  end
end
