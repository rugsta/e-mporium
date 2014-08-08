require 'spec_helper'

describe Product do

  before :each do
    @product = Product.new(
        :product_name => "new product",
        :category_id => 1,
        :note => "all about my new product",
        :price => 12.99)
  end

  it "is valid with a name, category, note and price" do
    expect(@product).to be_valid
  end

  it "is invalid without a product name" do
    @product.product_name = nil
    expect(@product).to be_invalid
  end

  it "is invalid without a category id" do
    @product.category_id = nil
    expect(@product).to be_invalid
  end

  it "is invalid without a note " do
    @product.note = nil
    expect(@product).to be_invalid
  end

  it "is invalid without a price" do
    @product.price = nil
    expect(@product).to be_invalid
  end

end


