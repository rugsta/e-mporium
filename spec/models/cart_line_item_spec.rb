require 'spec_helper'

describe CartLineItem do

    it "is valid with a cart_id, product_id" do
      expect(FactoryGirl.build(:cart_line_item)).to be_valid
    end

    it "is invalid without a cart_id" do
      expect(FactoryGirl.build(:cart_line_item, cart_id: nil)).to be_invalid
    end

    it "is invalid without a product_id" do
      expect(FactoryGirl.build(:cart_line_item, product_id: nil)).to be_invalid
    end

end
