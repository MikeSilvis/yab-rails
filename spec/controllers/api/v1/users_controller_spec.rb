require 'spec_helper'

describe Api::V1::UsersController do

  describe 'POST :create' do
    let(:params) do
      { phone_number: 814_574_613_9, name: 'Mike Silvis', email: 'mikesilvis@gmail.com' }
    end
    context 'adds a new user' do
      subject do
        post :create, user: params
      end
      it 'creates a user', :show_in_doc do
        expect { subject }.to change { User.count }.by(1)
      end
    end
    context 'json response' do
      before { post :create, user: params }
      it { assert_response 200 }
      it { JSON.parse(response.body)['user']['name'].should == params[:name] }
    end
  end

  describe 'GET :show' do
    let(:user_1) { create :user }
    let(:user_2) { create :user }
    let(:params) do
      { id: id, authentication_token: user_1.authentication_token }
    end
    let(:user_response) { JSON.parse(response.body)['user'] }
    let(:auth_token) { user_response['authentication_token'] }

    context 'unauthenticated request' do
      before { get :show, id: user_1.id }
      it { assert_response :unauthorized }
    end

    context 'authenticated request for self' do
      let(:id) { user_1.id }
      before { get :show, params  }
      it { auth_token.should == user_1.authentication_token }
      it { user_response['profile_photo_url'].should == 'http://mikesilvis.com/myimage.png' }
    end

    context 'authenticated request for another user' do
      let(:id) { user_2.id }
      before { get :show, params  }
      it { auth_token.should be_nil }
    end

  end

end
