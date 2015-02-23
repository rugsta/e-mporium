require 'spec_helper'

describe CartsController do

  before(:each) do
    request.env["HTTP_REFERER"] = "/category_list/1"
  end

  describe 'POST #create' do

    it 'generates and activation code if one does not exist' do
      Product_to_add_to_cart = FactoryGirl.create(:product, :with_category_id)
      post :add_to_cart, :id => Product_to_add_to_cart

      expect(response.cookies['store_user']).not_to be_empty
    end

    it 'generates a cart if required' do
      request.env["HTTP_REFERER"] = "/category_list/1"
      Product_to_add_to_cart_a = FactoryGirl.create(:product, :with_category_id)
      post :add_to_cart, :id => Product_to_add_to_cart_a
      expect(Cart.count).to eq(1)
    end

    it 'does not generate a cart if one already exists' do
      Product_to_add_to_cart_b = FactoryGirl.create(:product, :with_category_id)
      Product_to_add_to_cart_c = FactoryGirl.create(:product, :with_category_id)
      post :add_to_cart, :id => Product_to_add_to_cart_b
      post :add_to_cart, :id => Product_to_add_to_cart_c

      expect(Cart.count).to eq(1)
    end

    it 'adds cart line items' do
      Product_to_add_to_cart_d = FactoryGirl.create(:product, :with_category_id)
      post :add_to_cart, :id => Product_to_add_to_cart_d.id
      post :add_to_cart, :id => Product_to_add_to_cart_d.id

      CartID = Cart.first.id
      expect(CartLineItem.count('cart_id', :conditions => 'cart_id = CartID')).to eq(2)
    end

    it 'deletes cart line items' do
      Product_to_add_to_cart_e = FactoryGirl.create(:product, :with_category_id)
      post :add_to_cart, :id => Product_to_add_to_cart_e.id
      post :add_to_cart, :id => Product_to_add_to_cart_e.id

      expect(CartLineItem.count).to eq(2)
      delete :delete_item_from_cart, :id => CartLineItem.last.id
      expect(CartLineItem.count).to eq(1)

    end

  end

end
