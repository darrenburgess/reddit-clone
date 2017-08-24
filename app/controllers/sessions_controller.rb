class SessionsController < ApplicationController
  before_action :set_categories, only: [:new, :create, :destroy]

  def new 
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user.authenticate(params[:password])
      flash[:notice] = "Welcome, #{@user.username}"
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      flash[:notice] = "Username or password incorrect"
      render :new
    end
  end

  def destroy
    flash[:notice] = "You are logged out"
    session[:user_id] = nil
    redirect_to posts_path
  end

  private

  def set_categories
    @categories = Category.all
  end
end
