require 'selenium-webdriver'


Given(/^a user views a shop with a categories and products$/) do
  FactoryGirl.create(:category_with_products, :category_name => "Bob")
  FactoryGirl.create(:category_with_products, :category_name => "Dave")

  visit(store_path)
  sleep(1)
  first(:link, "Bob").click
end

When(/^a user adds the product to the cart$/) do
  click_on('More Info')
  first(:link, "Buy Now").click
  page.find_by_id('mini_cart_total').click
end

Then(/^a user can pay for the product$/) do
  #TODO Make all this work accross TEST and STAGING ENVIRONMENTS
  #find("img[alt='Btn xpresscheckout']").click
end


