class Api::V1::MerchantsController < Api::BaseController
  def index
    render json: Merchant.all
  end
end
