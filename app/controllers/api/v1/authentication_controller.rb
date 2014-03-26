class Api::V1::AuthenticationController < Api::BaseController
  def create
    render json: current_user
  end

  private

  def access_token
    params.require(:user).permit(:facebook_auth_token)
  end

  def current_user
    @current_user ||= User.find_or_create_from_facebook(access_token[:facebook_auth_token])
  end
end
