require 'spec_helper'

describe CategoriesController do

  before(:each) do
    session[:user_id] = 1
  end

  describe "Authorise" do

    context "when user is un-authorised" do
      it "redirects when the user id is invalid" do
        session[:user_id] = -1
        get :index
        expect(response.status).to eq(302 )
      end

    end

    context "when user is authorised" do
      it "renders the index page" do
        get :index
        expect(response.status).to eq(200)
      end

    end
  end


  describe "GET #index" do
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end

    it "populates an array of categories" do
      category1 = FactoryGirl.create(:category_active)
      category2 = FactoryGirl.create(:category_inactive)
      get :index
      expect(assigns(:categories)).to match_array([category1, category2])
    end

  end


  describe "GET #edit" do
    it "renders the :edit template" do
      category = FactoryGirl.create(:category_active)
      get :edit, :id => category.id
      expect(response).to render_template :edit
    end

    it "retrieves the correct category to edit" do
      category = FactoryGirl.create(:category_active)
      get :edit, :id => category.id
      expect(assigns(:category)).to eq category
    end
  end


  describe "POST #create" do
    it "saves a category with valid attributes" do
      to_match_category = FactoryGirl.build(:category_inactive)
      post :create, category: FactoryGirl.attributes_for(:category_inactive)
      expect(Category.first.category_name).to eq(to_match_category.category_name)
    end

    it "does not save a category with invalid attributes" do
      post :create, category: FactoryGirl.attributes_for(:category_inactive, :category_name => "")
      expect(Category.count).to eq(0)
    end
  end


  describe "PUT #update" do
    it "updates a category with valid attributes" do
      saved_category = FactoryGirl.create(:category_active)
      put :update, :id => saved_category.id, category: FactoryGirl.attributes_for(:category, :category_name => "Updated Name")
      expect(assigns(:category).category_name).to eq("Updated Name")
  end

    it "does not update a category with invalid attributes" do
      saved_category = FactoryGirl.create(:category_active)
      put :update, :id => saved_category.id, category: FactoryGirl.attributes_for(:category, :category_name => "")
      expect(assigns(:category).category_name).to_not eq(Category.first.category_name)
    end
  end


  describe "DELETE #destroy" do
    it "deletes a category from the database" do
      saved_category =FactoryGirl.create(:category_active)
      FactoryGirl.create(:category_inactive)

      delete :destroy, :id => saved_category.id
      expect(Category.count).to eq(1)
    end

    it 'renders the categories#index' do
      saved_category =FactoryGirl.create(:category_active)
      delete :destroy, :id => saved_category.id
      expect(response).to redirect_to(categories_path)
    end
  end

end
