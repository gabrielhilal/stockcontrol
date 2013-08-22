class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

  protected
    def authorize
      unless User.find_by_id(session[:user_id])
        flash[:error] = 'Please login first.'
        redirect_to login_path
      end
    end

    def director
      unless current_user.role == 'director'
        flash[:error] = 'Authorisation is required to access this content.'
        redirect_to root_path
      end
    end

    def manager
      unless current_user.role == 'manager' or  current_user.role == 'director'
        flash[:error] = 'Authorisation is required to access this content.'
        redirect_to root_path
      end
    end

    def supervisor
      unless current_user.role == 'manager' or  current_user.role == 'director' or  current_user.role == 'supervisor'
        flash[:error] = 'Authorisation is required to access this content.'
        redirect_to root_path
      end
  end

end
