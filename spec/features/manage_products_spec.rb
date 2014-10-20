require 'spec_helper'
require 'helpers/session_helper_spec'

describe 'FEATURE manage products', js: true do

  it 'allows adding of products' do
    FactoryGirl.create(:category)

    login
    click_link('Add Product')
    fill_in('Product name', :with => 'new product')
    select('FG Active Category', :from => 'Category')
    fill_in('Note', :with => 'this product is a test product')
    fill_in('Price', :with => '19.98')
    click_button('Create Product')

    expect(page).to have_selector(:link, 'new product')
    #TODO expect(page).to have image
  end

  it 'allows editing of products' do
    FactoryGirl.create(:category_with_products)

    login
    click_link('Products')
    click_link('Edit')
    fill_in('Product name', :with => 'new product')
    click_button('Update Product')
    click_link('Products')

    expect(page).to have_selector(:link, 'new product')
  end

  it 'allows viewing of of list products' do
    FactoryGirl.create(:category_with_products)
    FactoryGirl.create(:category_with_products)

    login
    expect(page).to have_selector(:link, 'Factory Girl Created Product 1')
    expect(page).to have_selector(:link, 'Factory Girl Created Product 2')
  end


  it 'allows deleting of products' do
    FactoryGirl.create(:category_with_products)
    login
    click_link('Products')
    click_link('Edit')

    expect(page).not_to have_selector(:link, 'Factory Girl Created Product 1')
  end


end