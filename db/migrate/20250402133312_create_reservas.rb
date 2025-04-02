class CreateReservas < ActiveRecord::Migration[7.1]
  def change
    create_table :reservas do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :data
      t.string :status

      t.timestamps
    end
  end
end
