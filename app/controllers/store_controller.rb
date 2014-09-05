class StoreController < ApplicationController

  skip_before_action :authorize

  def index

    if params[:category_id]
      @products = Product.where(:category_id => params[:category_id])
      @active_categories = Category.where('active' => true).all
    else
      @products = Product.joins(:category).where(:categories => {:active => true}).order(:category_id)
      @active_categories = Category.where('active' => true).all

    end

    #either params on index
    #or
    #by category
    #or
    #via name space for admin
  end

end
