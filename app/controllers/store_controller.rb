class StoreController < ApplicationController

  skip_before_action :authorize

  def index

    if params[:category_id]
      @products = Product.where(:category_id => params[:category_id])
      get_active_categories
      @images = Image.all
    else
      @products = Product.joins(:category).where(:categories => {:active => true}).order(:category_id)
      get_active_categories
      @images = Image.all
    end

    #either params on index
    #or
    #by category
    #or
    #via name space for admin
  end

end
