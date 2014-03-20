class ApplicationController < ActionController::Base
  attr_accessor :current_user
  protect_from_forgery with: :exception

  before_action :authenticate_user_from_token!
  after_action :set_csrf_cookie

  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end

  private

  def set_csrf_cookie
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def authenticate_user_from_token!
    token              = params[:authentication_token].presence
    self.current_user  = token && User.find_by(authentication_token: token)
  end
end
