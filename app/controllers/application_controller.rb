class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :logged_out?, :require_user, :access_denied

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def logged_out?
    !logged_in?
  end

  def require_user
    access_denied unless logged_in?
  end

  def access_denied
    flash[:error] = "You must be logged in to do that"
    redirect_to root_path
  end

  def set_categories
    @categories = Category.all
  end
end
