require 'spec_helper'
require 'helpers/session_helper_spec'

describe 'FEATURE Store Front Category Listings', js: true do

  before(:each) do
    FactoryGirl.create(:category_with_products, :category_name => "Bob")
    FactoryGirl.create(:category_with_products, :category_name => "Dave")
  end

  it 'allows customers to only see products under a specific category' do
    visit(store_path)

    first(:link, "Bob").click
    expect(page).to have_css('#product_description', :text => 'Factory Girl Created Product 1')
    expect(page).not_to have_css('#product_description', :text => 'Factory Girl Created Product 2')
  end

end        clci