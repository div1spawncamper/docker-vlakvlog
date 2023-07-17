Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root "articles#index"
  get '/auth/github/callback', to: 'users/omniauth_callbacks#github'
  resources :articles do
    resources :comments
  end
end
