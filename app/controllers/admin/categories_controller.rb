class Admin::CategoriesController < ApplicationController

  before_filter :all_categories, :only => [:index, :create, :edit, :update]

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      flash.now[:error] = "Your form has some errors."
      render :edit
    end
  end

  def index
    new
  end

  def all_categories
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      flash[:error] = "Your form has some errors."
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.active = false
    category.save!

    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit(:category_name, :active)
  end

end
