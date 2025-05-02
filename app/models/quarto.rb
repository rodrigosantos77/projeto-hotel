class Quarto < ApplicationRecord
    has_many :reservas  # Um quarto pode ter muitas reservas
  
    # Validações
    validates :numero, presence: true, uniqueness: true
    validates :tipo, presence: true
    validates :status, presence: true  # Exemplo de campo que poderia ser usado para status (disponível, reservado, etc.)
  end
  