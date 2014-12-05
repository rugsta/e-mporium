require 'spec_helper'

describe Admin::UsersController do

  before(:each) do
    session[:user_id] = 1
  end

  describe "GET #index" do
    it "renders the :index template" do
      FactoryGirl.create(:user)
      get :index
      expect(response).to render_template :index
    end

    it "returns an array of users" do
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user_another)
      get :index
      expect(assigns(:users)).to match_array([user1, user2])
    end
  end

  describe "POST #create" do
    it "saves a user with valid attributes" do
      to_match_user = FactoryGirl.build(:user)
      post :create, user: FactoryGirl.attributes_for(:user)
      expect(User.first.name).to eq(to_match_user.name)
    end

    it "does not save a user with invalid attributes" do
      post :create, user: FactoryGirl.attributes_for(:user, :name => "")
      expect(User.count).to eq(0)
    end
  end

  describe "GET #edit" do
    it "renders the :edit view" do
      user = FactoryGirl.create(:user)
      get :edit, :id => user.id
      expect(response).to render_template :edit
    end

    it "retrieves the correct record" do
      user = FactoryGirl.create(:user)
      get :edit, :id => user.id
      expect(assigns(:user)).to eq user
    end
  end

  describe "PUT #update" do
    it "updates a user password with valid attributes" do
      user = FactoryGirl.create(:user)
      put :update, :id => user.id, user: FactoryGirl.attributes_for(:user, :password => "new_password", :password_confirmation => "new_password")
      expect(assigns(:user).password).to eq("new_password")
    end
  end

  describe "DESTROY #delete" do
    it "deletes the correct user" do
      user = FactoryGirl.create(:user)
      delete :destroy, :id => user.id
      expect(User.count).to eq(0)
    end
  end
end