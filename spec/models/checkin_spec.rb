require 'spec_helper'

describe Checkin do
  let(:user) { create :user }
  let(:merchant) { create :merchant }
  let!(:reward_1) { create :reward, points: 5, merchant: merchant }
  let!(:reward_2) { create :reward, points: 10, merchant: merchant }
  let!(:reward_3) { create :reward, points: 15, merchant: merchant }
  let(:checkin) { create :checkin, user: user, merchant: merchant }

  describe 'rewards' do
    describe '.next_reward' do
      subject { checkin.next_reward }
      it { should == reward_2 }
    end
    describe '.next_reward_points' do
      subject { checkin.next_reward_points }
      it { should == 10 }
    end
  end
end
