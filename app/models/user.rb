class User < ActiveRecord::Base
  before_save :set_authentication_token, if: proc { |u| u.authentication_token.blank? }

  def self.find_or_create_from_facebook(token)
    facebook = Yab::Facebook.new(token).me
    params = {
      facebook_id: facebook['id'],
      name: facebook['name'],
      birthday: Date.strptime(facebook['birthday'], '%m/%d/%Y'),
      gender: facebook['gender'],
      email: facebook['email']

    }
    User.where(email: params[:email]).first_or_create(params)
  end

  def phone_number=(value)
    super(value.to_s.gsub(/\D/, ''))
  end

  private

  def set_authentication_token
    self.authentication_token = generate_authentication_token
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.find_by(authentication_token: token)
    end
  end

end
