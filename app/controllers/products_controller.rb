class ProductsController < ApplicationController

  before_filter :active_categories, :only => [:new, :edit]

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to root_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.delete
    redirect_to(root_path)
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to root_path
  end


  private
  def product_params
    params.require(:product).permit(:product_name, :note, :category_id, :archived, :price )
  end

  def active_categories
    @active_categories = Category.where('active' => true).all
  end
end
