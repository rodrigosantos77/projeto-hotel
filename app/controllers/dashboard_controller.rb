class DashboardController < ApplicationController
  before_action :require_login
  layout "dashboard"

def index
  @user = User.find(session[:user_id]) if session[:user_id]

  if @user.atendente?
    render 'index_atendente'
  else
    @reservas = @user.reservas.includes(:quarto)  # Carrega reservas só se for cliente
    render 'index_cliente'
  end
end

private

def require_login
  redirect_to login_path, alert: "Você precisa estar logado para acessar o dashboard." unless session[:user_id]
end
end