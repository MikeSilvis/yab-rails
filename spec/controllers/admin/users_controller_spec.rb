require 'spec_helper'

describe Admin::UsersController do
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

  describe 'get :new' do
    before { get :new }
    it { assert_response :success }
  end

  describe 'edit :edit' do
    before { get :edit, id: user.id }
    it { assert_response :success }
  end

  describe 'get :show' do
    before { get :show, id: user.id }
    it { assert_response :success }
  end
end
