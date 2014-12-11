require 'spec_helper'

describe 'FEATURE: Store Front', js: true do

  before(:each) do
    FactoryGirl.create(:category_with_products, :category_name => "Active Cat 1")
    FactoryGirl.create(:category_with_products, :category_name => "Active Cat 2")
    FactoryGirl.create(:category_with_products, :inactive, :category_name => "Inactive Cat 1")

  end

  it 'allows customers to see only active categories' do
    visit (store_path)

    expect(page).to have_link('Active Cat 1')
    expect(page).to have_link('Active Cat 2')
    expect(page).not_to have_css('#product_description', :text => 'Factory Girl Created Product 1')
    expect(page).not_to have_css('#product_description', :text => 'Factory Girl Created Product 2')
    expect(page).not_to have_link('Inactive Cat 1')
  end

end