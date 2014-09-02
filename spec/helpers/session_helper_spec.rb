require 'spec_helper'

def login
    user = FactoryGirl.create(:user)
    visit '/sessions/new'

    fill_in('Email', :with => user.email)
    fill_in('Password', :with => "qwerty")
    click_button('Enter')
end