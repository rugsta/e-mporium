require 'spec_helper'

describe Image do

  it 'is valid with name and active status' do
    expect(FactoryGirl.build(:image)).to be_valid
  end

end