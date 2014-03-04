class Api::V1::UsersController < ApplicationController

  # DOC GENERATED AUTOMATICALLY: REMOVE THIS LINE TO PREVENT REGENARATING NEXT TIME
  api :POST, "/v1/users", "Create an user"
  param :user, Hash do
    param :name, :undef
    param :phone_number, :undef
  end
  def create
    render json: User.first_or_create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:phone_number, :name, :beta)
  end

end
