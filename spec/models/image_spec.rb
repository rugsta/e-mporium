require 'spec_helper'

describe Image do

  it 'is valid with name and active status' do
    expect(FactoryGirl.build(:image)).to be_valid
  end

  it 'is invalid without a product id' do
    expect(FactoryGirl.build(:image, product_id: "")).to be_invalid
  end

end