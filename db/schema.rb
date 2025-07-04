# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_06_09_201933) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "quartos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.decimal "preco"
    t.string "imagem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "numero"
    t.string "tipo"
    t.string "status"
  end

  create_table "reservas", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "data"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "check_in"
    t.datetime "check_out"
    t.integer "quarto_id"
    t.integer "numero_pessoas"
    t.index ["user_id"], name: "index_reservas_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "cliente"
    t.string "nome"
    t.string "cpf"
    t.string "rg"
    t.string "address"
    t.string "phone"
    t.string "gender"
  end

  add_foreign_key "reservas", "users"
end
