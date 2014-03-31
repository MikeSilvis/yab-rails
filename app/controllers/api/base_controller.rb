class Api::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  private

  def authenticate_user!
    @current_user  = User.find_by(authentication_token: params[:authentication_token])
    render json: :unauthorized, status: :unauthorized unless current_user
  end
end
