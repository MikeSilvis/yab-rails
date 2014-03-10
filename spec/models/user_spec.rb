require 'spec_helper'

describe User do

  describe '.phone_number=' do
    let(:user) { User.new }
    let(:real_number) { '8145746139' }
    subject { user.phone_number }
    before { user.phone_number = value }

    context 'with pure numbers' do
      let(:value) { 814_574_613_9 }
      it { should == real_number }
    end

    context 'with spaces in the number' do
      let(:value) { '814 574 6139' }
      it { should == real_number }
    end

    context 'with () and -' do
      let(:value) { '(814) 574-6139' }
      it { should == real_number }
    end

  end

  describe '#find_or_create_from_facebook' do
    let(:token) { 'ACCESS_TOKEN' }
    subject { User.find_or_create_from_facebook(token) }
    context 'creates a new user when they dont exist' do
      it { expect { subject }.to change { User.count }.by(1) }
      it { subject.name.should == 'Mike Silvis' }
    end
    context 'finds a user when they do exist' do
      before { subject }
      it { expect { subject }.to change { User.count }.by(0) }
    end
  end

  describe '.generate_authentication_token' do
    subject { User.new }
    context 'generates a token if there is not one set' do
      before { subject.save }
      it { subject.authentication_token.should_not be_nil }
    end
    context 'does not change the token on update' do
      before { subject.save }
      let!(:current_token) { subject.authentication_token }
      it do
        subject.update_attributes!(name: 'Mike Silvis')
        subject.reload.authentication_token.should == current_token
      end
    end
  end

end
