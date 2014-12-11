class CategoryListController < ApplicationController

  skip_before_action :authorize

  def show

      @products = Product.where(:category_id => params[:id])
      get_active_categories

      @current_category_list = @active_categories.find_by_id(params[:id])

      @images = Image.all
      #TODO limit image loading to products shown




    #else
    #  @products = Product.joins(:category).where(:categories => {:active => true}).order(:category_id)
    #end

  end

end
