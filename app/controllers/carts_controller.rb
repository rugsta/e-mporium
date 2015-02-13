class CartsController < ApplicationController

  skip_before_action :authorize


  def create
    @cart = Cart.new
    @cart.user_id = cookies[:store_user]
    @cart.save!
  end

  def add_to_cart
    if cookies[:store_user].blank?
      generate_activation_code(50)
      create
      generate_cart_line_item
      redirect_to(:back)
    else
      @cart = Cart.find_by user_id:(cookies[:store_user])
      generate_cart_line_item
      redirect_to(:back)
    end
  end

  def generate_activation_code(size)
    charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    @store_user_id = (0...size).map{ charset[rand(size-1)] }.join

    cookies[:store_user] = { :value => @store_user_id, :expires => 1.hour.from_now }
  end

  def generate_cart_line_item
    @cart_line_item = CartLineItem.new
    @cart_line_item.product_id = params[:id]
    @cart_line_item.cart_id = @cart.id
    @cart_line_item.save!
  end

  def show_invoice

  end

  def delete_item_from_cart
    @line_item_to_delete = CartLineItem.find(params[:id])
    @line_item_to_delete.delete
    redirect_to(:back)
  end

end