class SessionsController < ApplicationController
  #require 'ruby-debug';debugger

  skip_before_action :authorize

  def new
  end

  def index
    create
  end

  def create
    user = User.find_by(:email => params[:sessions][:email])

    if user.nil?
      flash[:error] = "Invalid email and/or password"
      redirect_to(new_session_path)
    elsif user and user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      session[:name] = user.name
      flash[:error] = "Invalid email and/or password"
      redirect_to(products_index_path)
    else
      redirect_to(new_session_path)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(store_path)
  end
end
