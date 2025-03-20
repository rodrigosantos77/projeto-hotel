class UsersController < ApplicationController
  # Define o layout para as ações 'new' (cadastro) e 'show'
  layout 'cad_user/cad_user', only: [:new]
  layout 'show_user', only: [:show]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'O usuário foi criado com sucesso!!.'
    else
      render :new, layout: 'cad_user/cad_user'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
