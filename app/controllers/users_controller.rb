class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  
  # Define o layout para as ações específicas
  layout 'cad_user/cad_user', only: [:new]
  layout 'show_user', only: [:show]

  def new
    @user = User.new
    render layout: 'cad_user/cad_user'
  end

  #metodo para exibir o  perfil do usuario
  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: 'Usuário criado com sucesso! Faça seu login.'
    else
      render :new, layout: 'cad_user/cad_user'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :nome,
      :username,
      :email,
      :password,
      :password_confirmation,
      :cpf,
      :rg,
      :address,
      :phone,
      :gender
    )
  end
end
