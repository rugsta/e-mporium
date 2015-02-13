require 'spec_helper'
require 'helpers/session_helper_spec'

describe 'FEATURE cart and cart line items', js: true do

  before(:each) do
    FactoryGirl.create(:category_with_products, :category_name => "Bob")
  end

  it 'adds a product to the cart' do
    visit(store_path)

    first(:link, "Bob").clickgot
    first(:link, "Buy Now").click
    expect(page).to have_css('#mini-cart', :text => 'You have 1 item(s) in your cart')
    expect(page).to have_css('#mini-cart', :text => "19.99")

  end

end
