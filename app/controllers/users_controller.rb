class UsersController < ApplicationController
  # Define o layout para as ações 'new' (cadastro) e 'show'
  layout 'cad_user/cad_user', only: [:new]
  layout 'show_user', only: [:show]

  def new
    @user = User.new
    render layout: 'cad_user/cad_user'  # Garante que o layout correto será carregado
  end

  def show
    @user = User.find(params[:id])
  end

  def create
  @user = User.new(user_params)
  if @user.save
    redirect_to login_path, notice: 'Usuário criado com sucesso! Faça seu login.'
  else
    render :new, layout: 'cad_user/cad_user'  # Mantém o layout correto se houver erro no cadastro
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
