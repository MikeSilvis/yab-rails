class User < ActiveRecord::Base
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :set_authentication_token, if: proc { |u| u.authentication_token.blank? }
  before_validation :set_random_password, on: :create, if: proc { |u| u.password.blank? }
  include Point
  devise :database_authenticatable

  belongs_to :market
  belongs_to :merchant
  has_many :checkins
  has_many :locations, through: :checkins
  has_many :merchants, through: :checkins
  has_many :user_rewards
  has_many :rewards, through: :user_rewards
  belongs_to :current_level, class_name: 'Level'
  belongs_to :next_level, class_name: 'Level'
  INCLUDE_FIELDS = [:current_level, :next_level, :checkins, :rewards, user_rewards: { merchant: Merchant::INCLUDE_FIELDS }]

  def self.find_or_create_from_facebook(token)
    facebook = Yab::Facebook.new(token).me
    params = {
      facebook_id: facebook['id'],
      name: facebook['name'],
      birthday: (facebook['birthday'] if facebook['birthday'].present?),
      gender: facebook['gender'],
      email: facebook['email']
    }
    User.where(email: params[:email]).first_or_create!(params)
  end

  def phone_number=(value)
    super(value.to_s.gsub(/\D/, ''))
  end

  def register_checkin(attrs)
    location = Location.for_beacon!(attrs)
    if location
      checkins
        .where(location: location)
        .where(created_at: DateTime.now.beginning_of_day..DateTime.now.end_of_day)
        .first_or_create!(merchant_id: location.merchant_id)
    end
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
