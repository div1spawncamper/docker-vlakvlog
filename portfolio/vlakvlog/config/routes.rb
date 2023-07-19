Rails.application.routes.draw do
  namespace :admin do
      resources :articles
      resources :comments
      resources :roles
      resources :users

      root to: "articles#index"
    end
  get 'home/index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions' }
  root "articles#index"
  get '/auth/github/callback', to: 'users/omniauth_callbacks#github'
  resources :articles do
    resources :comments
  end
end
