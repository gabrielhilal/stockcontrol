class SessionsController < ApplicationController

  def new
    unless current_user.nil?
      redirect_to current_user
    end
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Welcome ' + current_user.username
      redirect_to home_path
    else
      flash.now[:error] = 'Invalid username/password combination.'
      render 'new'
    end
  end

end
