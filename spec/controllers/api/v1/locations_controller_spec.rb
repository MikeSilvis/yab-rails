require 'spec_helper'

describe Api::V1::LocationsController do
  describe 'POST :create' do
    let(:user) { User.create!(name: 'Mike Silvis') }
    let(:location_response) { JSON.parse(response.body)['location'] }

    let(:latitude) { 123.234343 }
    let(:latitude_2) { 123.234123 }
    let(:latitude_3) { 124.234123 }

    let(:longitude) { 321.2342432 }
    let(:longitude_2) { 321.2342312 }
    let(:longitude_3) { 322.2342312 }

    let(:params) do
      {
        location: { latitude: latitude, longitude: longitude },
        authentication_token: user.authentication_token
      }
    end

    subject { post :create, params }

    context 'for an existing location' do
      before do
        user.locations.create!(latitude: latitude_2, longitude: longitude_2)
      end
      it { expect { subject }.to change { Location.count }.by(0) }
      it do
        subject
        location_response['latitude'].should == latitude_2.to_s
      end
    end
    context 'for a new location' do
      let(:latitude) { latitude_3 }
      let(:longitude) { longitude_3 }
      it do
        subject
        location_response['latitude'].should == latitude_3.to_s
      end
      it { expect { subject }.to change { Location.count }.by(1) }
    end

  end

end
