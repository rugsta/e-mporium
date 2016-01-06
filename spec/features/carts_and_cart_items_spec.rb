require 'spec_helper'
require 'helpers/session_helper_spec'


describe 'FEATURE cart and cart line items', js: true do

  before(:each) do
    FactoryGirl.create(:category_with_products, :category_name => "Bob")
  end

  it 'add a product to the cart' do
    visit(store_path)

    first(:link, "Bob").click
    first(:link, "Buy Now").click

    expect(page).to have_css('#mini-cart', :text => 'You have 1 item(s) in your cart')
    expect(page).to have_css('#mini-cart', :text => "19.99")


  end

  it 'allows the viewing of an invoice' do
    visit(store_path)

    first(:link, "Bob").click
    first(:link, "Buy Now").click

    page.find_by_id('mini_cart_total').click
    expect(page).to have_content("Invoice")
  end


  it 'delete a product from the cart' do

    FactoryGirl.create(:category_with_products, :id => 1)

    cart
    first(:link, "Delete").click

    expect(page).to have_content("There are no items in your cart")

  end



end
