class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Simply not needed yet.
  #before_filter :authenticate_user_from_token!
  after_filter :set_csrf_cookie_for_ng

  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end

  private

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  #def authenticate_user_from_token!
    #token = params[:authentication_token].presence
    #user  = token && User.find_by(authentication_token: token)

    #sign_in user, store: false if user
  #end

end
