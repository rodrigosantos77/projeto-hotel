Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  # Página inicial
  root 'home#index'

  # Rotas para usuários (sem redundância)
  resources :users, only: [:new, :create, :show, :edit, :update]

  # Rotas para as sessões [login/logout]
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  # Outras rotas
  get '/sobre', to: 'sobre#index'
  get 'up', to: 'rails/health#show', as: :rails_health_check
end
