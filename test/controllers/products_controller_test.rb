require 'test_helper'

class ProductsControllerTest < ActionController::TestCase

  setup do
    @product = products(:one)

    @update = { product_name => 'test setup product',
                category_id => 1,
                note => 'product note',
                price => '19.99'
  end


end
