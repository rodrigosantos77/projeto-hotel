Rails.application.routes.draw do
  # Página inicial
  root 'home#index'

  # Página de saúde para verificação
  get 'up', to: 'rails/health#show', as: :rails_health_check

  # Rotas para a página "sobre"
  get '/sobre', to: 'sobre#index'

  # Outras rotas da página inicial
  get 'home/index'

  # Comentários adicionais
  # Adicione novas rotas abaixo conforme necessário

  # Exemplo de rota de recursos (descomente se necessário)
  # resources :articles

end
