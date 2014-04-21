require 'spec_helper'

describe Admin::DashboardController do
  render_views

  let(:user) { create :admin }

  before do
    controller.instance_variable_set(:@current_user, user)
    ApplicationController.any_instance.stub(:authenticate_admin_user!)
  end

  describe 'get :index' do
    before { get :index }
    it { assert_response :success }
  end
end
