class AddCamposToQuartos < ActiveRecord::Migration[7.1]
  def change
    add_column :quartos, :numero, :string
    add_column :quartos, :tipo, :string
    add_column :quartos, :status, :string
  end
end
