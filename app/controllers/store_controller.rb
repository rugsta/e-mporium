class StoreController < ApplicationController

  skip_before_action :authorize

  def index
      get_active_categories
      show_cart
  end

end
