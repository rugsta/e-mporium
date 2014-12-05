class Admin::ProductsController < ApplicationController

  before_filter :active_categories, :only => [:new, :edit, :create, :update]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    1.upto(5) {@product.images.build}
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to(admin_products_path)
    else
      flash.now[:error] = "Your form has some errors."
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.delete
    redirect_to(admin_products_path)
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])

    x = Image.where("product_id = #{params[:id]}").count
    x = 5 - x
    1.upto(x) {@product.images.build}
  end

  def update
    @product = Product.find(params[:id])

    #splits the product and image, strips the image of blanks and reformats
    params = product_params
    images_attributes = params.select{|k,v| k == "images_attributes"}

    if images_attributes != {}
      params = params.select{|k,v| k != "images_attributes"}
      params = params.merge("images_attributes" => images_attributes["images_attributes"].select {|k,v| v != {}})
    end

    if @product.update(params)
      redirect_to(edit_admin_product_path)
    else
      flash.now[:error] = "Your form has some errors."
      render :edit
    end
  end


  private

  def product_params
    params.require(:product).permit(:product_name, :note, :category_id, :archived, :price, images_attributes: [:image] )
  end

  def active_categories
    @active_categories = Category.where('active' => true).all
  end

end
