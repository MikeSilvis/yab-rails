class Api::V1::MerchantController < Api::BaseController
  def index
    render json: Merchant.all
  end
end
