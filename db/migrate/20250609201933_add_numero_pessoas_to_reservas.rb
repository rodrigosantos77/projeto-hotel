class AddNumeroPessoasToReservas < ActiveRecord::Migration[7.1]
  def change
    add_column :reservas, :numero_pessoas, :integer
  end
end
