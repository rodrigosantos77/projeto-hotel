class AddFieldsToReservas < ActiveRecord::Migration[7.1]
  def change
    add_column :reservas, :check_in, :datetime
    add_column :reservas, :check_out, :datetime
   # add_column :reservas, :user_id, :integer
    add_column :reservas, :quarto_id, :integer
  end
end
