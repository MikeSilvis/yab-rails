class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  attr_reader :current_user
  after_action :set_csrf_cookie

  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end

  private

  def set_csrf_cookie
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def access_denied(exception)
    redirect_path = @current_user ? root_path : user_session_path
    redirect_to redirect_path, alert: exception.message
  end

  def authenticate_admin_user!
    @current_user = warden.user
  end
end
