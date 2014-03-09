require 'spec_helper'

describe PagesController do

  describe 'GET :partners' do
    before { get :partners }
    it { assert_response 200 }
  end

  describe 'GET :consumers' do
    before { get :consumers }
    it { assert_response 200 }
  end

end
