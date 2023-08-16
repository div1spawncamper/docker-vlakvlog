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
    member do
      delete 'delete_image', to: 'articles#delete_image'
    end
  end

  resources :comments do
    member do
      delete 'delete_image', to: 'comments#delete_image'
    end
  end
end
