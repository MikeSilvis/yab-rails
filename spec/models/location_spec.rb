require 'spec_helper'

describe Location do
  describe '.minor' do
    subject { build :location, major: major, minor: minor }
    let(:major) { '1' }
    let(:minor) { '1' }
    context 'valid when nothing is taken' do
      it { should be_valid }
    end
    context 'when the major and minor is taken' do
      before { create :location, major: major, minor: minor }
      it { should_not be_valid }
    end
    context 'when just the major is taken' do
      before { create :location, major: major, minor: 2 }
      it { should be_valid }
    end
  end
end
