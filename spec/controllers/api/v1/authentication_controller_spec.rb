require 'spec_helper'

describe Api::V1::AuthenticationController do

  describe 'POST :create' do
    context 'creates a user' do
      subject { post :create, user: { facebook_auth_token: 'SUPER_SECRET_TOKEN' } }
      it 'finds or creates a user', :show_in_doc do
        expect { subject }.to change { User.count }.by(1)
      end
    end
    context 'json response' do
      before { post :create, user: { facebook_auth_token: 'SUPER_SECRET_TOKEN' } }
      it { assert_response 200 }
      it { JSON.parse(response.body)['user']['authentication_token'].should_not be_nil }
    end
  end

end
