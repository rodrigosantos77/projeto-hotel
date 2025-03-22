class DashboardController < ApplicationController
  before_action :require_login  # Garante que só usuários logados acessem
  layout "dashboard"  # Usa um layout separado para o Dashboard

  def index
    @user = User.find(session[:user_id]) if session[:user_id]
  end

  private

  def require_login
    redirect_to login_path, alert: "Você precisa estar logado para acessar o dashboard." unless session[:user_id]
  end
end
