require 'spec_helper'


describe 'FEATURE login', js: true do

  it 'allows admin users to login' do
    user = FactoryGirl.create(:user)
    visit '/sessions/new'

    fill_in('Email', :with => user.email)
    fill_in('Password', :with => "qwerty")
    click_button('Enter')

    expect(page).to have_css('.inline-nav-user', :text => "Current User : ")
  end

  it 'validates against invalid users logging in' do
    user = FactoryGirl.create(:user)
    visit '/sessions/new'

    fill_in('Email', :with => user.email)
    fill_in('Password', :with => "invalid password")
    click_button('Enter')

    expect(page).to have_css('.alert.alert-danger', :text => "Invalid email and/or password.")
  end

  it 'lets users log out' do
    login

    click_link('Log Out')
    expect(page).not_to have_css('.inline-nav-user', :text => "Current User : ")

  end

end

