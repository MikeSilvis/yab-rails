require 'spec_helper'

describe Market do
  let(:market) { Market.new }
  describe '.beta?' do
    subject { market.beta? }
    context 'for a new record' do
      it { should be_false }
    end
    context 'for a record with it set to true' do
      before do
        market.beta = true
        market.save
        market.reload
      end
      it { should be_true }
    end
    context 'for a record with it set to false' do
      before do
        market.beta = false
        market.save
        market.reload
      end
      it { should be_false }
    end
  end
end
