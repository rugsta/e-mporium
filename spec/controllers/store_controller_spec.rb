require 'spec_helper'

describe StoreController do

  describe 'GET #index' do

    it 'renders the store :index template' do
      get :index
      expect(response).to render_template :index
    end

    it 'renders products' do
      category = FactoryGirl.create(:category_active)
      product = FactoryGirl.create(:product)
      get :index
      expect(assigns(:products)).to match_array([product])
    end

    it 'only renders active categories' do
      category_active = FactoryGirl.create(:category_active)
      category_inactive = FactoryGirl.create(:category_inactive)
      get :index
      expect(assigns(:active_categories)).to match_array([category_active])
    end
  end
end
