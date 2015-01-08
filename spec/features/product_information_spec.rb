require 'spec_helper'

describe 'FEATURE: Product Information', js: true do


  before(:each) do
    FactoryGirl.create(:category_with_products, :category_name => "Active Cat 1")

  end

  it 'allows customer to see more information on a product' do
    visit(store_path)

    first(:link, "Active Cat 1").click
    click_on('More Info')

    expect(page).to have_css('#product_description', :text => 'Factory Girl Created Product 1')
  end

end