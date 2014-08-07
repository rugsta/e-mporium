class SessionsController < ApplicationController

  skip_before_action :authorize

  def new

  end

  def index
    create
  end

  def create

    user = User.find_by(:email => params[:sessions][:email])
    #require 'ruby-debug';debugger
    if user.nil?
      flash.now[:error] = "Your form has some errors. 2"
      redirect_to(new_session_path)
    elsif user and user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      session[:name] = user.name
       flash.now[:error] = "Your form has some errors. 1"
       redirect_to(products_index_path)
    else
      redirect_to(new_session_path)
    end
  end

  def destroy
    session[:user_id] = nil
    flash.now[:error] = "Your form has some errors. 3"
    redirect_to(store_path)

  end
end
