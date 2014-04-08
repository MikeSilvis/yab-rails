class MarketsController < ApplicationController
  def show
  end

  private

  def market
    @market ||= Market.find_by(slug: params[:id])
  end
  helper_method :market
end
