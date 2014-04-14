require 'spec_helper'

describe Api::V1::MerchantsController do

  describe 'GET :index' do
    let(:user) { create :user }
    let!(:merchant) { create :merchant }
    let(:merchant_response) { JSON.parse(response.body)['merchants'] }
    before { get :index, authentication_token: user.authentication_token  }
    it { assert_response :success }
    it { merchant_response.first['name'].should == merchant.name }
  end

end
