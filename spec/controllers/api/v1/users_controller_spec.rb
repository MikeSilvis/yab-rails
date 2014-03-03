require 'spec_helper'

describe Api::V1::UsersController do

  describe 'POST :create' do
    context 'adds a new user' do
      subject do
        post :create, :user => { phone_number: 8145746139, name: 'Mike Silvis' }
      end
      it { expect { subject }.to change { User.count }.by(1) }
    end
    context 'json response' do
      before { post :create, :user => { phone_number: 8145746139, name: 'Mike Silvis' } }
      it { assert_response 200 }
      it { JSON.parse(response.body)['user'].keys.sort.should == ['id', 'name', 'phone_number'].sort }
    end
  end

end
