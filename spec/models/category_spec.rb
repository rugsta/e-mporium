require 'spec_helper'


describe Category do

  it 'is valid with name and active status' do
    expect(FactoryGirl.build(:category)).to be_valid
  end

  it 'is invalid without a name' do
    expect(FactoryGirl.build(:category, category_name: nil)).to be_invalid
  end

end