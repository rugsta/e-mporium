require 'spec_helper'


describe Category do

  before :each do
    @category = Category.new(
        :category_name => "new category",
        :active => true)
  end


  it 'is valid with name and active status' do
    expect(@category).to be_valid
  end

  it 'is invalid without a name' do
    @category.category_name = nil
    expect(@category).to be_invalid
  end

end