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
    redirect_to root_path, alert: exception.message
  end

  def authenticate_user!
    @current_user = User.first
  end

end
