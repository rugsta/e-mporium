class ProductInformationController < ApplicationController

  skip_before_action :authorize

  def show
    @product = Product.find(params[:id])

    @active_categories = Category.where('active' => true).all
    @images = Image.where('product_id' => params[:id])
  end

end