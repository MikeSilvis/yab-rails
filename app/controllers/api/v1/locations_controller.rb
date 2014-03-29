class Api::V1::LocationsController < Api::BaseController
  def create
    render json: current_user.find_location(location_params[:latitude], location_params[:longitude])
  end

  private

  def location_params
    params.require(:location).permit(:latitude, :longitude)
  end
end
