class SuporteController < ApplicationController
  def create
    # Aqui você pode colocar a lógica para salvar ou enviar a mensagem de suporte.
    flash[:notice] = "Mensagem enviada com sucesso!"
    redirect_to dashboard_path
  end
end
