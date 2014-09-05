require 'spec_helper'

describe StoreController do

  describe 'GET #index' do

    it 'renders the store :index template' do
      get :index
      expect(response).to render_template :index
    end

    it 'renders products' do
      FactoryGirl.create(:category, :id => 1)
      product = FactoryGirl.create(:product, :with_id)
      get :index
      expect(assigns(:products)).to match_array([product])
    end

    it 'only renders active categories' do
      category_active = FactoryGirl.create(:category)
      category_inactive = FactoryGirl.create(:category, :inactive)
      get :index
      expect(assigns(:active_categories)).to match_array([category_active])
    end
  end
end
