require 'spec_helper'

describe User do

  let(:user) { create :user }

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
    subject { build :user }
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

  describe '.register_checkin' do
    let!(:location) { create :location, merchant: (create :merchant) }
    let(:attr_params) { { major: location.major, minor: location.minor } }
    subject { user.register_checkin(attr_params) }

    context 'for a non-exsistant location' do
      let(:attr_params) { { major: 123, minor: location.minor } }
      it { expect { subject }.to raise_error(ActiveRecord::RecordNotFound) }
    end

    context 'creates a new checkin when one does not exist' do
      it { expect { subject }.to change { Checkin.count }.by(1) }
    end

    context 'for an existing checkin' do
      let!(:recent_checkin) { user.register_checkin(attr_params) }
      it { expect { subject }.to change { Checkin.count }.by(0) }
      context 'when it was yesterday'do
        before { recent_checkin.update_attribute(:created_at, 2.days.ago) }
        it { expect { subject }.to change { Checkin.count }.by(1) }
      end
    end
  end

  describe 'levels' do
    let!(:level_1) { create :level, points: 5 }
    let!(:level_2) { create :level, points: 10 }
    let!(:level_3) { create :level, points: 15 }
    let!(:checkin_1) { create :checkin, user: user }

    describe '.current_level' do
      subject { user.current_level }
      it { should == level_1 }
      context 'when they have multiple checkins' do
        let!(:checkin) { create :checkin, user: user }
        it { should == level_2 }
      end
    end

    describe '.next_level' do
      subject { user.next_level }
      it { should == level_2 }
      context 'when they hit the max level' do
        let!(:checkin_1) { create :checkin, user: user }
        let!(:checkin_2) { create :checkin, user: user }
        it { should == level_3 }
      end
    end

  end

  describe '.user_rewards' do
    let!(:merchant) { create :merchant }
    let!(:location) { create :location, merchant: merchant }
    let!(:reward) { create :reward, merchant: merchant, points: 5 }
    subject { user.user_rewards.find_by(merchant: merchant) }
    before { user.register_checkin({ major: location.major, minor: location.minor }) }
    it { should be_a UserReward }
    it { subject.reward.should == reward }
    it { subject.user.should == user }
    it { subject.merchant.should == merchant }
  end
end
