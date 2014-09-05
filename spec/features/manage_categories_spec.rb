require 'spec_helper'
require 'helpers/session_helper_spec'

describe 'FEATURE manage categories', js: true do

  it 'allows adding of a category' do
    login
    click_link('Categories')
    fill_in('Category name', :with => "new category")
    click_button('Create Category')

    expect(page).to have_css("#category_name", :text => "new category")
  end

  it 'allows editing of a category' do
    FactoryGirl.create(:category)

    login
    click_link('Categories')
    click_link('Edit')

    expect(page).to have_selector("input[value='FG Active Category']")

    fill_in('Category name', :with => "UPDATED FG Active Category")
    click_button('Update Category')

    expect(page).to have_css("#category_name", :text => "UPDATED FG Active Category")
  end

  it 'allows deleting of a category' do
    FactoryGirl.create(:category)

    login
    click_link('Categories')
    click_link('Delete')

    expect(page).not_to have_selector("input[value='FG Default Category']")
  end
end