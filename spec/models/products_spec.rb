require 'spec_helper'

describe Product do

  it "is valid with a name, category, note and price" do
    expect(FactoryGirl.build(:product)).to be_valid
  end

  it "is invalid without a product name" do
    expect(FactoryGirl.build(:product, product_name: nil)).to be_invalid
  end

  it "is invalid without a category id" do
    expect(FactoryGirl.build(:product, category_id: nil)).to be_invalid
  end

  it "is invalid without a note " do
    expect(FactoryGirl.build(:product, note: nil)).to be_invalid
  end

  it "is invalid without a price" do
    expect(FactoryGirl.build(:product, price: nil)).to be_invalid
  end

end


