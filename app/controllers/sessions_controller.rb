class SessionsController < ApplicationController
  # Ação para exibir o formulário de login
  def new
  end

  # Ação para criar uma sessão (login)
  def create
    @user = User.find_by(email: params[:email])

    # Verifica se o usuário existe e se a senha está correta
    if @user&.authenticate(params[:password])
      # Inicia a sessão do usuário
      session[:user_id] = @user.id
      redirect_to @user, notice: 'Login realizado com sucesso.'
    else
      flash.now[:alert] = 'Email ou senha inválidos.'
      render :new
    end
  end

  # Ação para destruir a sessão (logout)
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Desconectado com sucesso.'
  end
end
