
class ReservasController < ApplicationController
  layout "layout_reserva"
  before_action :set_reserva, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # Lista todas as reservas
  def index
    if current_user.atendente?
      @reservas = Reserva.all.order(check_in: :asc)
    else
      @reservas = current_user.reservas.order(check_in: :asc)
    end
  end

  # Histórico de reservas
  def historico
    @reservas = current_user.reservas.order(created_at: :desc)
  end

  # Exibe uma reserva específica
  def show; end

  # Formulário de nova reserva
  def new
    @reserva = Reserva.new
  end

  # Cria uma nova reserva
  def create
    @reserva = Reserva.new(reserva_params)
    @reserva.user = current_user

    if quarto_ocupado?(@reserva)
      flash.now[:alert] = "Este quarto já está reservado nesse período."
      render :new, status: :unprocessable_entity
    elsif @reserva.save
      redirect_to dashboard_path, notice: 'Reserva criada com sucesso!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Formulário para editar
  def edit; end

  # Atualiza uma reserva existente
  def update
    @reserva.assign_attributes(reserva_params)

    if quarto_ocupado?(@reserva)
      flash.now[:alert] = "Este quarto já está reservado nesse período."
      render :edit, status: :unprocessable_entity
    elsif @reserva.save
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
        format.html { redirect_to dashboard_path, alert: 'Reserva não encontrada.' }
        format.js { render js: "alert('Reserva não encontrada.');" }
      elsif current_user.atendente? || @reserva.user == current_user
        if @reserva.destroy
          format.html do
            if current_user.atendente?
              redirect_to dashboard_path, notice: 'Reserva excluída com sucesso!'
            else
              redirect_to reservas_url, notice: 'Reserva excluída com sucesso!'
            end
          end
          format.js
        else
          format.html { redirect_to dashboard_path, alert: 'Erro ao excluir a reserva.' }
          format.js { render js: "alert('Erro ao excluir a reserva.');" }
        end
      else
        format.html { redirect_to dashboard_path, alert: 'Você não tem permissão para excluir esta reserva.' }
        format.js { render js: "alert('Você não tem permissão para excluir esta reserva.');" }
      end
    end
  end

  private

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
    params.require(:reserva).permit(:check_in, :check_out, :status, :quarto_id, :numero_pessoas)
  end

  # Verifica se há conflito de datas para o quarto
  def quarto_ocupado?(reserva)
    Reserva.where(quarto_id: reserva.quarto_id, status: "ativa")
           .where.not(id: reserva.id)
           .where("check_in < ? AND check_out > ?", reserva.check_out, reserva.check_in)
           .exists?
  end
end
