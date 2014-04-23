require 'spec_helper'

describe Api::V1::CheckinsController do
  let!(:user) { create :user }
  let(:location) { create :location, merchant: (create :merchant) }
  let(:checkin_response) { JSON.parse(response.body)['checkin'] }

  describe 'POST :create' do
    let(:params) do
      {
        checkin: { major: location.major, minor: location.minor },
        authentication_token: user.authentication_token
      }
    end
    before { post :create, params }
    it do
      checkin_response['id'].should_not be_nil
      checkin_response['level']['earned'].should eq(5)
      assert_response :created
    end
    context 'with an invalid beacon' do
      let(:location) { double(major: "rabble", minor: "boom") }
      it { assert_response :not_found }
    end
  end
end
