class CategoriesController < ApplicationController


  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    redirect_to categories_path
  end

  def index
    @categories = Category.all
    new
  end

  def show_categories
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
    @categories = Category.all
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to categories_path
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:category_name, :active)
  end

end
