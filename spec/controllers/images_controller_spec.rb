require 'spec_helper'

describe ImagesController do

  before(:each) do
    session[:user_id] = 1
  end

  describe "GET #index" do
    it "renders the #index view" do
      FactoryGirl.create(:image)
    end
  end

  describe "DELETE #destroy" do
    it "deletes an image from the database" do
      saved_image = FactoryGirl.create(:image)
      FactoryGirl.create(:image)

      delete :destroy, :id => saved_image.id
      expect(Image.count).to eq(1)
    end
  end

end
