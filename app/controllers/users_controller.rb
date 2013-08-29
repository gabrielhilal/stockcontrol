class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :director, except: :show
  skip_before_action :authorize, only: :show

  def index
    @users = User.search(params[:search]).where.not(id: current_user.id).order(params[:sort])
  end

  def show
    redirect_to login_path unless !current_user.nil?
    @user = current_user
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user= User.new(user_params)
    if @user.save
      flash[:notice] = "User #{get_name} created"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User #{get_name} updated"
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
   @user.destroy
    flash[:notice] = "User #{get_name} deleted"
    redirect_to users_path
  end

private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :role, :venue_id, :password, :password_confirmation)
  end

  def get_name
    @user.username
  end
end
