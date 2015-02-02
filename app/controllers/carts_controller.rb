class CartsController < ApplicationController

  skip_before_action :authorize

  def create

    if cookies[:store_user].blank?
      generate_activation_code(50)
      generate_cart
      generate_cart_line_item
      redirect_to(:back)
    else
      @cart = Cart.find_by user_id:(cookies[:store_user])
      generate_cart_line_item
      redirect_to(:back)
    end

  end

  def show
      render :show
  end

  def generate_activation_code(size)
    charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    @store_user_id = (0...size).map{ charset[rand(size-1)] }.join

    cookies[:store_user] = { :value => @store_user_id, :expires => 1.hour.from_now }
  end

  def generate_cart
    @cart = Cart.new
    @cart.user_id = cookies[:store_user]
    @cart.save!
  end

  def generate_cart_line_item
    @cart_line_item = CartLineItem.new
    @cart_line_item.product_id = params[:id]
    @cart_line_item.cart_id = @cart.id
    @cart_line_item.save!
  end

end