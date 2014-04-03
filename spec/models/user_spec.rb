require 'spec_helper'

describe User do

  let(:user) { User.new(email: 'mikesilvis@gmail.com') }

  describe '.phone_number=' do
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
    subject { user }
    context 'generates a token if there is not one set' do
      before { subject.save! }
      it { subject.authentication_token.should_not be_nil }
    end
    context 'does not change the token on update' do
      before { subject.save! }
      let!(:current_token) { subject.authentication_token }
      it do
        subject.update_attributes!(name: 'Mike Silvis')
        subject.reload.authentication_token.should == current_token
      end
    end
  end

  describe '.register_location' do
    let(:user) { User.create!(name: 'Mike Silvis', email: 'mikesilvis@gmail.com') }
    let(:latitudes) { [123.234343, 123.234123, 124.234123] }
    let(:longitudes) { [321.2342432, 321.2342312, 322.2342312] }
    let(:lat_param) { latitudes.first }
    let(:lng_param) { longitudes.first }
    subject { user.register_location(lat_param, lng_param) }

    context 'creates a new location when one does not exist' do
      it { expect { subject }.to change { Location.count }.by(1) }
      it { subject.latitude.should == lat_param }
      it { subject.reload.ping_count.should == 1 }
      context 'for multiple instances' do
        before { user.register_location(lat_param, lng_param) }
        it { subject.reload.ping_count.should == 2 }
      end
    end

    context 'for an existing lat lng' do
      let!(:recent_location) do
        user.locations.create!(latitude: latitudes[1], longitude: longitudes[1])
      end
      context 'when it is over the time limit' do
        before { recent_location.update_attribute(:created_at, 1.days.ago) }
        it { expect { subject }.to change { Location.count }.by(1) }
      end
      context 'when it is within the time limit' do
        it { expect { subject }.to change { Location.count }.by(0) }
      end
    end

  end

end
