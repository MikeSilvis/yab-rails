class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :set_authentication_token, if: proc { |u| u.authentication_token.blank? }
  before_validation :set_random_password, on: :create
  devise :database_authenticatable

  has_many :locations, as: :locationable
  belongs_to :market

  def find_location(lat, lng)
    locations.within_range(lat, lng).first_or_create(latitude: lat, longitude: lng)
  end

  def self.find_or_create_from_facebook(token)
    facebook = Yab::Facebook.new(token).me
    params = {
      facebook_id: facebook['id'],
      name: facebook['name'],
      birthday: Date.strptime(facebook['birthday'], '%m/%d/%Y'),
      gender: facebook['gender'],
      email: facebook['email']

    }
    User.where(email: params[:email]).first_or_create!(params)
  end

  def phone_number=(value)
    super(value.to_s.gsub(/\D/, ''))
  end

  def lat_lng
    locations.map { |l| { lat: l.latitude, lng: l.longitude } }
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

  def set_random_password
    self.password = Devise.friendly_token
  end
end
