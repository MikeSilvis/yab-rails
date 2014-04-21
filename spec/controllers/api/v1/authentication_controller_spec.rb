require 'spec_helper'

describe Api::V1::AuthenticationController do

  describe 'POST :create' do
    let(:params) do
      { user: { facebook_auth_token: 'SUPER_SECRET_TOKEN' } }
    end
    context 'creates a user' do
      subject { post :create, params }
      it 'finds or creates a user', :show_in_doc do
        expect { subject }.to change { User.count }.by(1)
      end
    end
    context 'json response' do
      let(:authentication_token) do
        JSON.parse(response.body)['user']['authentication_token']
      end
      before { post :create, params }
      it { assert_response :created }
      it { authentication_token.should_not be_nil }
    end
  end

end
