class Api::V1::AuthenticationController < ApplicationController

  def create
    render json: { user: { authentication_token: User.find_or_create_from_facebook(access_token).authentication_token } }
  end

  private

  def access_token
    params.require(:user).permit(:facebook_auth_token)
  end

end
