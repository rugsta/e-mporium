require 'spec_helper'

describe 'FEATURE: Product Information', js: true do

  it 'allows customer to see more information on a product' do
    #TODO how the link to this url
    visit(store_path)
    #
    #
    #click_link("/product_information/" && ProductToFind.id)
    #expect(page).to have_css('#product_description', :text => 'Factory Girl Created Product 1')
    #expect(page).not_to have_css('#product_description', :text => 'Factory Girl Created Product 2')
  end

end