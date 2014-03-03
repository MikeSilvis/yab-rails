require 'spec_helper'

describe User do

  describe '.phone_number=' do
    let(:user) { User.new }
    let(:real_number) { 8145746139 }
    subject { user.phone_number }
    before { user.phone_number=(value) }

    context 'with pure numbers' do
      let(:value) { 8145746139 }
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

end
