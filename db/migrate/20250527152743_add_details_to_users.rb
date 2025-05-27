class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :cpf, :string
    add_column :users, :rg, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :gender, :string
  end
end
