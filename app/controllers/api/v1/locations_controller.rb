class Api::V1::LocationsController < Api::BaseController
  def create
    render json: current_user.register_location(lat_param, lng_param)
  end

  private

  def location_params
    params.require(:location).permit(:latitude, :longitude)
  end

  def lat_param
    location_params[:latitude]
  end

  def lng_param
    location_params[:longitude]
  end
end
