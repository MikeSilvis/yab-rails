require 'spec_helper'

describe Api::V1::CheckinsController do
  let!(:user) { create :user }
  let(:location) { create :location, merchant: (create :merchant) }
  let(:checkin_response) { JSON.parse(response.body)['checkin'] }

  describe 'POST :create' do
    let(:params) do
      {
        checkin: { uuid: location.uuid, identifier: location.identifier },
        authentication_token: user.authentication_token
      }
    end
    before { post :create, params }
    it { checkin_response['id'].should_not be_nil }
    it { checkin_response['next_level_points'].should == 0 }
    it { assert_response :created }
    context 'with an invalid beacon' do
      let(:location) { double(uuid: "rabble", identifier: "boom") }
      it { assert_response :not_found }
    end
  end
end
