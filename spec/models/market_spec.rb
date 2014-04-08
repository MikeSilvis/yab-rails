require 'spec_helper'

describe Market do
  let(:market) { Market.new }
  describe '.show_greek?' do
    subject { market.show_greek? }
    context 'for a new record' do
      it { should be_false }
    end
    context 'for a record with it set to true' do
      before do
        market.update_attribute(:show_greek, true)
        market.reload
      end
      it { should be_true }
    end
    context 'for a record with it set to false' do
      before do
        market.update_attribute(:show_greek, false)
        market.reload
      end
      it { should be_false }
    end
  end
end
