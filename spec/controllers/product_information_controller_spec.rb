require 'spec_helper'

describe ProductInformationController do

  describe "GET #show" do
    it "renders the #show view" do
      product = FactoryGirl.create(:product, :with_id)
      get :show, :id => product.id
      expect(response).to render_template :show
    end

    it "retrieves the correct product" do
      product = FactoryGirl.create(:product, :with_id)
      get :show, :id => product.id
      expect(assigns(:product)).to eq product
    end
  end

end