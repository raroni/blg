class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  helper_method :logged_in?, :public_post_path
  
  private
  def logged_in?
    !!session[:user_id]
  end
  
  def current_user
    logged_in? && User.find(session[:user_id])
  end
  
  def public_post_path(post)
    "/#{post.permalink}"
  end
  
  def authenticate!
    redirect_to root_path, :alert => 'You must login to access this page.' unless logged_in?
  end
end
