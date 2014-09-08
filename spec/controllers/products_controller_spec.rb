require 'spec_helper'

describe ProductsController do

  before(:each) do
    session[:user_id] = 1
  end

  describe "GET #index" do
    it "renders the #index view" do
      get :index
      expect(response).to render_template :index
    end

    it "renders an array of products" do
      product1 = FactoryGirl.create(:product, :with_id)
      product2 = FactoryGirl.create(:product, :with_id)
      get :index
      expect(assigns(:products)).to match_array([product1, product2])
    end
  end

  describe "GET #edit" do
    it "renders the :edit template" do
      product = FactoryGirl.create(:product, :with_id)
      get :edit, :id => product.id
      expect(response).to render_template :edit
    end

    it "retrieves the correct product to edit" do
      product = FactoryGirl.create(:product, :with_id)
      get :edit, :id => product.id
      expect(assigns(:product)).to eq product
    end
  end

  describe "POST #create" do

    it "saves a product with valid attributes" do
      to_match_product = FactoryGirl.build(:product, :with_id)
      post :create, product: FactoryGirl.attributes_for(:product, :with_id)
      expect(Product.first.note).to eql(to_match_product.note)
    end


    it "does not save a product with invalid attributes" do
      to_match_product = FactoryGirl.build(:product)
      post :create, product: FactoryGirl.attributes_for(:product, :with_id, :product_name => "")
      expect(Product.count).to eq(0)
    end
  end

  describe "PUT #update" do
    it "updates a product with valid attributes" do
      saved_product = FactoryGirl.create(:product, :with_id)
      put :update, :id => saved_product.id, product: FactoryGirl.attributes_for(:product, :with_id, :product_name => "Updated Name")
      expect(assigns(:product).product_name).to eq("Updated Name")
    end

    it "does not update a product with invalid attributes" do
      saved_product = FactoryGirl.create(:product, :with_id)
      put :update, :id => saved_product.id, product: FactoryGirl.attributes_for(:product, :with_id, :product_name => "")
      expect(assigns(:product).product_name).to_not eq("Updated Name")

    end
  end

  describe "GET #show" do
    it "retrieves the correct product" do
      product = FactoryGirl.create(:product, :with_id)
      get :show, :id => product.id
      expect(assigns(:product)).to eq product
    end
  end

  describe "DESTROY #delete" do
    it "deletes the correct product" do
      product = FactoryGirl.create(:product, :with_id)
      delete :destroy, :id => product.id
      expect(Product.count).to eq(0)
    end
  end

end








