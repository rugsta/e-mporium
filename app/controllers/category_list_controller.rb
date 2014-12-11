class CategoryListController < ApplicationController

  skip_before_action :authorize

  def show

      @products = Product.where(:category_id => params[:id])

      get_active_categories
      @images = Image.all
      #TODO limit image loading to products shown

    #else
    #  @products = Product.joins(:category).where(:categories => {:active => true}).order(:category_id)
    #  get_active_categories
    #  @images = Image.all
    #end

  end

end
