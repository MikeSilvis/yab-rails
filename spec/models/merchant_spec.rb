require 'spec_helper'

describe Merchant do
  let(:merchant) { create :merchant }

  describe '.state' do
    it { merchant.demand_generation?.should be_true }
    context 'does not set to an invalid state' do
      before do
        merchant.aasm_state = 'rabble'
        merchant.save
      end
      it { merchant.errors.messages[:aasm_state].should == ['is invalid'] }
    end
  end
end
