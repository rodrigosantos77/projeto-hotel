class DashboardController < ApplicationController
  before_action :require_login
  layout "dashboard"

  def index
    @user = User.find(session[:user_id]) if session[:user_id]

    if @user.atendente?
      # Paginar as reservas do atendente
      @reservas = Reserva.includes(:user, :quarto)
                         .order(created_at: :desc)
                         .page(params[:page])
                         .per(4)
      render 'index_atendente'
    else
      # Paginar as reservas do cliente
      @reservas = @user.reservas.includes(:quarto)
                               .order(created_at: :desc)
                               .page(params[:page])
                               .per(4)
      render 'index_cliente'
    end
  end

  private

  def require_login
    redirect_to login_path, alert: "Você precisa estar logado para acessar o dashboard." unless session[:user_id]
  end
end
