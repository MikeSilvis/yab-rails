class Api::V1::VenuesController < Api::BaseController
  def index
    render json: Venue.all
  end
end
