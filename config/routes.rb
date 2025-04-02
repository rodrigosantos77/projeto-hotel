Rails.application.routes.draw do
  # Página inicial
  root 'home#index'

  # Rotas do Dashboard
  get 'dashboard/index'
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  # Rotas de Sessão (Login/Logout)
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  # Rotas para Usuários
  resources :users, only: [:new, :create, :show, :edit, :update]
  get '/signup', to: 'users#new', as: 'signup'

  # Rotas para Reservas
  resources :reservas

  # Outras Rotas
  get '/sobre', to: 'sobre#index'
  get 'up', to: 'rails/health#show', as: :rails_health_check
end

