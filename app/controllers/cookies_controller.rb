class CookiesController < ApplicationController

  skip_before_action :authorize

  def new
  end

  def index
    create
  end

  def create
    if (cookies[:store_user].blank?)
      generate_activation_code(50)
      puts @store_user_id
      cookies[:store_user_id] = { :value => @store_user_id, :expires => 1.hour.from_now, :domain => "store-app.com" }
    end
  end


  def generate_activation_code(size)
    @store_user_id = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end

end