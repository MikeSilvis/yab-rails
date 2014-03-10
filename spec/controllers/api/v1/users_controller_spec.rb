require 'spec_helper'

describe Api::V1::UsersController do

  describe 'POST :create' do
    let(:params) { { phone_number: 814_574_613_9, name: 'Mike Silvis' } }
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
      it { JSON.parse(response.body)['user'].keys.sort.should == ['id', 'name', 'phone_number'].sort }
    end
  end

  describe 'GET :show' do
    let(:user) { User.create(name: 'Mike Silvis') }
    before { get :show, id: user.authentication_token }
    it { assert_response :success }
    it { JSON.parse(response.body)['user']['name'].should == user.name }
  end

end
