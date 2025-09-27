
class Reserva < ApplicationRecord
  # Relacionamentos
  belongs_to :user
  belongs_to :quarto

  # Validações básicas
  validates :user_id, presence: true
  validates :quarto_id, presence: true
  validates :check_in, presence: true
  validates :check_out, presence: true
  validate  :check_out_after_check_in
  validate  :no_overlapping_reservations, if: -> { check_in.present? && check_out.present? }

  private

  # Verifica se a data de saída é posterior à data de entrada
  def check_out_after_check_in
    if check_out <= check_in
      errors.add(:check_out, "deve ser posterior à data de entrada")
    end
  end

  # Impede sobreposição de reservas para o mesmo quarto
  def no_overlapping_reservations
    conflito = Reserva.where(quarto_id: quarto_id, status: "ativa")
                      .where.not(id: id)
                      .where("check_in < ? AND check_out > ?", check_out, check_in)

    if conflito.exists?
      errors.add(:base, "Este quarto já está reservado nesse período")
    end
  end
end
