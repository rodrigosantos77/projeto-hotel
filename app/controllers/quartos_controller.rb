
class QuartosController < ApplicationController
  layout "quartos", only: [:index]  
  layout "quarto", only: [:show]   

  def index
    @quartos = Quarto.all
  end

  def show
    @quarto = Quarto.find(params[:id])
  end
end
