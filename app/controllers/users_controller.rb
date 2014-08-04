class UsersController < ApplicationController

  before_filter :all_users, :only => [:index, :create, :edit, :update]

  def new
    @user = User.new
  end

  def index
    new
  end

  def all_users
    @users = User.all
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to(user_index_path)
    else
      flash.now[:error] = "Your form has some errors."
      render :index
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password )
  end
end
