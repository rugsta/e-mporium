require 'spec_helper'

describe CategoryListController do

  describe 'GET #show' do

    describe "GET #show" do
      it "renders the #show view" do
        FactoryGirl.create(:category, :id => 1)
        product = FactoryGirl.create(:product, :with_category_id)

        get :show, :id => product.category_id
        expect(response).to render_template :show
      end



      it 'only renders products within selected category' do
        FactoryGirl.create(:category, :id => 1)
        showProduct = FactoryGirl.create(:product, :with_category_id)

        get :show,  :id => showProduct.category_id
        expect(assigns(:products)).to match_array([showProduct])
      end

      it 'only renders active categories' do
        categoryList = FactoryGirl.create(:category)
        FactoryGirl.create(:product, :with_category_id)
        doNotShowProduct = FactoryGirl.create(:product, :with_category_id, :category_id => 2)

        get :show, :id => categoryList.id
        expect(assigns(:active_categories)).not_to match_array([doNotShowProduct])
      end

    end
  end
end

