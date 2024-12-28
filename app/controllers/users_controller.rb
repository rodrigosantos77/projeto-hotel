class UsersController < ApplicationController
  # Define o layout para a ação 'new' (cadastro)
  layout 'cad_user/cad_user', only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'O usuário foi criado com sucesso!!.'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
