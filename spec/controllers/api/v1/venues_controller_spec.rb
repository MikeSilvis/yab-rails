require 'spec_helper'

describe Api::V1::VenuesController do
  let(:venues) { JSON.parse(response.body)['venues'] }
  before do
    Venue.create!(name: "Mike's BBQ")
  end
  describe 'GET :index' do
    before { get :index }
    it { assert_response 200 }
    it { venues.first['name'].should == "Mike's BBQ" }
  end
end
