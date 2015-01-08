require 'spec_helper'

describe Cart do

  it "is valid with a user_id" do
    expect(FactoryGirl.build(:cart, user_id: "dsfsfweoifweiofjweio")).to be_valid
  end

  it "is invalid without a user_id" do
    expect(FactoryGirl.build(:cart, user_id: nil)).to be_invalid
  end

end
