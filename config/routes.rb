Yab::Application.routes.draw do

  resources :markets, only: [:show]

  get 'partners', to: 'pages#partners'
  get 'consumers', to: 'pages#consumers'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :users, only: [:create, :index, :show]
      resources :checkins, only: [:create]
      resources :merchants, only: [:index]
      resources :authentication, only: [:create]
    end
  end

  apipie
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get ':id', to: 'markets#show'
  root 'markets#show', id: ''
end
