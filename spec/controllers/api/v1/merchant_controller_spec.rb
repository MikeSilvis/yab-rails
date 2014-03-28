require 'spec_helper'

describe Api::V1::MerchantController do

  describe 'GET :index' do
    let(:user_1) do
      User.create(name: 'Mike Silvis', email: 'mike@getyab.com')
    end
    let!(:merchant) { Merchant.create!(name: "Shandygaff") }
    let(:merchant_response) { JSON.parse(response.body)['merchant'] }
    before { get :index, authentication_token: user_1.authentication_token  }
    it { assert_response :success }
    it { merchant_response.first['name'].should == 'Shandygaff' }
  end

end
