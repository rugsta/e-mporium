require 'spec_helper'

def login

    page.set_rack_session(:user_id => 1)
    visit '/products'

    #user = FactoryGirl.create(:user)
    #visit '/sessions/new'
    #
    #fill_in('Email', :with => user.email)
    #fill_in('Password', :with => "qwerty")
    #click_button('Enter')
end