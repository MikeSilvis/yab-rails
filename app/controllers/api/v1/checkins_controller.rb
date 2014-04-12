class Api::V1::CheckinsController < Api::BaseController
  def create
    render json: current_user.register_checkin(checkin_params)
  end

  private

  def checkin_params
    params.require(:checkin).permit(:uuid, :identifier)
  end
end
