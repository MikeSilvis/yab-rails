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
    it { assert_response :success }
  end
end
