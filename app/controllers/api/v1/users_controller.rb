class Api::V1::UsersController < Api::BaseController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    render json: user, status: :created
  end

  def index
    render json: users
  end

  def show
    render json: User.find(params.require(:id))
  end

  private

  def user
    @user ||= User.where(email: user_params[:email]).first_or_create!(user_params)
  end

  def users
    @users ||= User.all
  end

  def user_params
    params.require(:user).permit(:phone_number, :name, :beta, :email, :market_id)
  end
end
