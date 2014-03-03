class Api::V1::UsersController < ApplicationController

  def create
    render json: User.first_or_create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:phone_number, :name, :beta)
  end

end
