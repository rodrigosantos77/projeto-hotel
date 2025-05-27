class User < ApplicationRecord
    has_many :reservas
    has_secure_password
    
    validates :nome, presence: true
    validates :username, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }

     # Novas validações
  
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 }
  validates :rg, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :gender, presence: true, inclusion: { in: %w[Masculino Feminino Outro], message: "%{value} não é uma opção válida" }


    # Definindo o enum para o papel (role) do usuário
  enum role: { cliente: 'cliente', atendente: 'atendente' }, _default: "cliente"
  end
  