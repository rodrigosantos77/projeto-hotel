class Reserva < ApplicationRecord
  belongs_to :user  # Assumindo que a reserva pertence ao usuário
  belongs_to :quarto # Supondo que a reserva tenha um quarto associado

  # Validações de dados
  validates :check_in, presence: true
  validates :check_out, presence: true
  validate :check_out_after_check_in
  validates :user_id, presence: true
  validates :quarto_id, presence: true

  private

  # Verifica se a data de saída é posterior à data de entrada
  def check_out_after_check_in
    if check_out.present? && check_in.present? && check_out <= check_in
      errors.add(:check_out, "deve ser posterior à data de entrada")
    end
  end
end
