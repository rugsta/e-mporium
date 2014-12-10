class ProductInformationController < ApplicationController

  skip_before_action :authorize

  def show
    @product = Product.find(params[:id])

    get_active_categories
    @images = Image.where('product_id' => params[:id])
  end

end