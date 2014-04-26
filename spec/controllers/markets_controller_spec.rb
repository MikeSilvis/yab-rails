require 'spec_helper'

describe MarketsController do
  describe 'GET :show' do
    let(:market) { create :market }
    before { get :show, id: market }
    it { assert_response 200 }
  end
end
