require 'spec_helper'

describe User do

  it "is valid with a name, email, password and matching password confirmation" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it "is invalid without a name" do
    expect(FactoryGirl.build(:user, name: nil)).to be_invalid
  end

  it "is invalid without an email" do
    expect(FactoryGirl.build(:user, email: nil)).to be_invalid
  end

  it "is invalid without a password" do
    expect(FactoryGirl.build(:user, password: nil)).to be_invalid
  end

  it "is invalid without a password confirmation" do
    expect(FactoryGirl.build(:user, password_confirmation: nil)).to be_invalid
  end

  it "is invalid without a matching password confirmation " do
    expect(FactoryGirl.build(:user, password_confirmation: "not_qwerty")).to be_invalid
  end

  it "it always has a lower case email" do
    user= FactoryGirl.create(:user, email: "UPPERCASE@UPPER.XXX")
    expect(user.email).to match("uppercase@upper.xxx")
  end



end