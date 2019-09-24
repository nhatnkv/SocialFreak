Rails.application.routes.draw do
  root to: 'pages#index'
  resources :pages
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
end
