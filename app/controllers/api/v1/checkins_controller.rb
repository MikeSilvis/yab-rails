class Api::V1::CheckinsController < Api::BaseController
  def create
    render json: checkin, status: :created
  end

  private

  def checkin
    @checkin ||= current_user.register_checkin(checkin_params)
  end

  def checkin_params
    params.require(:checkin).permit(:uuid, :identifier, :major, :minor)
  end
end
