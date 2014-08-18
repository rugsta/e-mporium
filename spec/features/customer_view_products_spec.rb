require 'spec_helper'

feature 'FEATURE: Store Front' do

  before(:each) do
    category = FactoryGirl.create(:category)
    category_active = FactoryGirl.create(:category_active)
    category_inactive = FactoryGirl.create(:category_inactive)

    FactoryGirl.create(:product, :category_id => category.id, :product_name => "viewable product under category")
    FactoryGirl.create(:product, :category_id => category_active.id, :product_name => "viewable product under active category")
    FactoryGirl.create(:product, :category_id => category_inactive.id, :product_name => "un-viewable product under un-viewable inactive category")
  end

  scenario 'customers can see active products and categories' do
    visit (store_path)
    click_link "FG Default Category"

    page.should have_content('FG Default Category')
    page.should have_content('FG Active Category')
    page.should have_content('viewable product under category')
  end

  scenario 'customers cannot see inactive products and categories' do
    visit (store_path)
    page.should have_no_content('FG Inactive Category')

    click_link "FG Default Category"
    page.should have_no_content('viewable product under active category')
    page.should have_no_content('un-viewable product under un-viewable inactive category')
  end
end