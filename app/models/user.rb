class User < ApplicationRecord
    has_many :reservas
    has_secure_password
    validates :username, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }

    # Definindo o enum para o papel (role) do usuário
  enum role: { cliente: 'cliente', atendente: 'atendente' }, _default: "cliente"
  end
  