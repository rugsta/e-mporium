require 'spec_helper'

describe 'FEATURE: Store Front', js: true do

  before(:each) do
    category = FactoryGirl.create(:category)
    category_active = FactoryGirl.create(:category_active)
    category_inactive = FactoryGirl.create(:category_inactive)

    FactoryGirl.create(:product, :category_id => category.id, :product_name => "Product viewable product under category")
    FactoryGirl.create(:product, :category_id => category_active.id, :product_name => "Product viewable product under active category")
    FactoryGirl.create(:product, :category_id => category_inactive.id, :product_name => "Product un-viewable product under un-viewable inactive category")
  end

  it 'allows customers to see active products and categories' do
    visit (store_path)
    click_link "FG Default Category"

    expect(page).to have_link('FG Default Category')
    expect(page).to have_link('FG Active Category')
    expect(page).to have_css('#product_description', :text => 'Product viewable product under category')


  end

  it 'does not allow customers to see inactive products and categories' do
    visit (store_path)
    click_link "FG Default Category"

    expect(page).not_to have_link('FG Inactive Category')
    expect(page).not_to have_css('#product_description', :text => 'Product viewable product under active category')
    expect(page).not_to have_css('#product_description', :text => 'Product un-viewable product under un-viewable inactive category')
 end
end