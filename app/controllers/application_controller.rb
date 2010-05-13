class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  helper_method :logged_in?
  
  private
  def logged_in?
    !!session[:user_id]
  end
  
  def current_user
    logged_in? && User.find(session[:user_id])
  end
  
  def authenticate!
    redirect_to root_path, :error => 'You must login to access this page.' unless logged_in?
  end
end
