class Api::V1::MerchantsController < Api::BaseController
  def index
    render json: Merchant.includes(:locations, :rewards).all
  end
end
