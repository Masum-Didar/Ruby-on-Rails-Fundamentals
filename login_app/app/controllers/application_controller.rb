class ApplicationController < ActionController::Base
    before_action :require_login

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def require_login
      unless current_user
        flash[:error] = "You must be logged in to access this section"
        redirect_to login_url
      end
    end

    def logged_in?
      !!session[:user_id]
    end
end
