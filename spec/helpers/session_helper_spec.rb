require 'spec_helper'

def login

    #page.set_rack_session(:user_id => 1)
    #visit admin_products_path

    KEPT FOR ANY LOGIN DEBUGGING
    user = FactoryGirl.create(:user)
    visit '/sessions/new'

    fill_in('Email', :with => user.email)
    fill_in('Password', :with => "qwerty")
    click_button('Enter')
end

def cart

  visit(category_list_path(1))

  first(:link, "Buy Now").click
  page.find_by_id('mini_cart_total').click

end