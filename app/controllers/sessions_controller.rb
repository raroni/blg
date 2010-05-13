class SessionsController < ApplicationController
  def create
    @user = User.find_by_email params[:email]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, :notice => "You're now logged in."
    else
      render :action => :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "You're now logged out."
  end
end
