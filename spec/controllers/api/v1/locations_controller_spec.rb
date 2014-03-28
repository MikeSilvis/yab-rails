require 'spec_helper'

describe Api::V1::LocationsController do
  describe 'POST :create' do
    let(:user) { User.create!(name: 'Mike Silvis') }
    let(:location_response) { JSON.parse(response.body)['location'] }
    let(:params) do
      {
        location: { latitude: 123, longitude: 321 },
        authentication_token: user.authentication_token
      }
    end
    before { post :create, params }
    it { assert_response 200 }
    it { location_response['latitude'].should == '123' }
  end
end
