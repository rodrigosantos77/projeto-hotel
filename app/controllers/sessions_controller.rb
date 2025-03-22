class SessionsController < ApplicationController
  layout "login"  # Usando um layout específico para a tela de login

  def new
  end

  def create
    @user = User.find_by(email: params[:email].downcase)

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path, notice: 'Login realizado com sucesso.'

    else
      flash.now[:alert] = 'Email ou senha inválidos.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Desconectado com sucesso.'
  end
end
