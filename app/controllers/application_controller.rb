class ApplicationController < ActionController::Base
    helper_method :current_user
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  
    def authenticate_user!
      redirect_to login_path, alert: "Você precisa estar logado para acessar essa página." unless current_user
    end
  end
  