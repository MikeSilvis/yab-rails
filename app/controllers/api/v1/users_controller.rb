class Api::V1::UsersController < Api::BaseController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    render json: User.where(email: user_params[:email]).first_or_create!(user_params)
  end

  def index
    render json: User.all
  end

  def show
    render json: User.find(params.require(:id))
  end

  private

  def user_params
    params.require(:user).permit(:phone_number, :name, :beta, :email, :market_id)
  end
end
