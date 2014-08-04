class StoreController < ApplicationController

  def index

    if params[:category_id]
      @products = Product.where(:category_id => params[:category_id])
      @active_categories = Category.where('active' => true).all
    else
      @products = Product.order(:category_id)
      @active_categories = Category.where('active' => true).all
    end

    #either params on index
    #or
    #by category
    #or
    #via name space for admin
  end

end
