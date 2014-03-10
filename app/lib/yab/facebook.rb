class Yab::Facebook
  attr_accessor :access_token
  APP_SECRET = 'e186e12bf25a6ae6d339e8479d5a5644'

  def initialize(access_token)
    self.access_token = access_token
  end

  def me
    client.get_objects('me')['me']
  end

  private

  def client
    @client ||= Koala::Facebook::API.new(access_token, APP_SECRET)
  end
end
