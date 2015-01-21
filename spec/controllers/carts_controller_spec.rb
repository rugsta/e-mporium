require 'spec_helper'

describe CartsController do

  before(:each) do
    request.env["HTTP_REFERER"] = "/category_list/1"
  end

  describe 'POST #create' do

    it 'generates and activation code if one does not exist' do
      Product_to_add_to_cart = FactoryGirl.create(:product, :with_id)
      post :create, :id => Product_to_add_to_cart.id

      expect(response.cookies['store_user']).not_to be_empty
    end

    it 'generates a cart if required' do
      request.env["HTTP_REFERER"] = "/category_list/1"
      Product_to_add_to_cart_1 = FactoryGirl.create(:product, :with_id)
      post :create, :id => Product_to_add_to_cart_1.id
      expect(Cart.count).to eq(1)
    end

    it 'does not generate a cart if one already exists' do
      Product_to_add_to_cart_2 = FactoryGirl.create(:product, :with_id)
      Product_to_add_to_cart_3 = FactoryGirl.create(:product, :with_id)
      post :create, :id => Product_to_add_to_cart_2.id
      post :create, :id => Product_to_add_to_cart_3.id

      expect(Cart.count).to eq(1)
    end

    it 'generates cart line items' do
      Product_to_add_to_cart_4 = FactoryGirl.create(:product, :with_id)
      post :create, :id => Product_to_add_to_cart_4.id
      post :create, :id => Product_to_add_to_cart_4.id

      CartID = Cart.first.id
      expect(CartLineItem.count('cart_id', :conditions => 'cart_id = CartID')).to eq(2)
    end

  end

end
