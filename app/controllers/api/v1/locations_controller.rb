class Api::V1::LocationsController < Api::BaseController
  def create
    render json: current_user.locations.where(location_params).first_or_create!
  end

  private

  def location_params
    params.require(:location).permit(:latitude, :longitude)
  end
end
