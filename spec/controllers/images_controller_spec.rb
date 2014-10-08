require 'spec_helper'

describe ImagesController do

  describe "GET #index" do
    it "renders the #index view" do
      FactoryGirl.create(:image)
    end
  end
end
