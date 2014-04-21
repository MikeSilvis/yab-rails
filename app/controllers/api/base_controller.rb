class Api::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  before_action :authenticate_user!

  private

  def authenticate_user!
    @current_user  = User.find_by(authentication_token: params[:authentication_token])
    render json: :unauthorized, status: :unauthorized unless current_user
  end

  def set_format
    request.format = 'json'
  end

  def not_found
    render json: :not_found, status: :not_found
  end
end
