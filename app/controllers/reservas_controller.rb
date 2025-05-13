class ReservasController < ApplicationController

    layout "layout_reserva" # Define um layout exclusivo
    before_action :set_reserva, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # Lista todas as reservas
  def index
    if current_user.atendente?
      @reservas = Reserva.all.order(data: :asc)
    else
      @reservas = current_user.reservas.order(data: :asc)
    end
  end
  

  # Exibe uma reserva específica
  def show
  end


  # Exibe o formulário de nova reserva
  def new
    @reserva = Reserva.new
  end


    # Cria uma nova reserva
  def create
    @reserva = Reserva.new(reserva_params)
    @reserva.user = current_user  # A reserva pertence ao usuário logado
    if @reserva.save
      redirect_to dashboard_path, notice: 'Reserva criada com sucesso!'
    else
      render :new, status: :unprocessable_entity
    end
  end


  # Exibe o formulário para editar uma reserva
  def edit
  end


  # Atualiza uma reserva existente
  def update
    if @reserva.update(reserva_params)
      redirect_to @reserva, notice: 'Reserva atualizada com sucesso!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

# Exclui uma reserva
def destroy
  @reserva = Reserva.find_by(id: params[:id])

  respond_to do |format|
    if @reserva.nil?
      format.html { redirect_to reservas_url, alert: 'Reserva não encontrada.' }
      format.js   { render js: "alert('Reserva não encontrada.');" }
    elsif current_user.atendente? || @reserva.user == current_user
      if @reserva.destroy
        format.html { redirect_to reservas_url, notice: 'Reserva excluída com sucesso!' }
        format.js   # ← Vai procurar o destroy.js.erb
      else
        format.html { redirect_to reservas_url, alert: 'Erro ao excluir a reserva.' }
        format.js   { render js: "alert('Erro ao excluir a reserva.');" }
      end
    else
      format.html { redirect_to reservas_url, alert: 'Você não tem permissão para excluir esta reserva.' }
      format.js   { render js: "alert('Você não tem permissão para excluir esta reserva.');" }
    end
  end
end


  # Busca a reserva pelo ID
  def set_reserva
    if current_user.atendente?
      @reserva = Reserva.find(params[:id])
    else
      @reserva = current_user.reservas.find(params[:id])
    end
  end
    
  # Define os parâmetros permitidos
  def reserva_params
    params.require(:reserva).permit(:check_in, :check_out, :status, :quarto_id)
  end  
end
