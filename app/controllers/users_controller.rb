  class UsersController < ApplicationController

  @change_pwd = false
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
      redirect_to(users_path)
    else
      flash.now[:error] = "Your form has some errors."
      render :index
    end
  end

  def edit
    @change_pwd = true
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to(users_path)
    else
      flash.now[:error] = "Your form has some errors."
      @change_pwd = true
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to(users_path)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
