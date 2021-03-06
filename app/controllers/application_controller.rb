class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorize
  before_action :get_active_categories
  before_action :show_cart

  protected

  def authorize
    #require 'ruby-debug';debugger
    if session[:user_id].to_i < 1
      flash[:error] = "Unauthorised path. Please log in."
      redirect_to(new_session_path)
    end
  end

  def get_active_categories
    @active_categories = Category.where('active' => true).all
  end

  def show_cart
    @my_cart = Cart.find_by_user_id(cookies[:store_user])
  end

end
