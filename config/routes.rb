Yab::Application.routes.draw do

  get 'partners', to: 'pages#partners'
  get 'consumers', to: 'pages#consumers'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index, :show]
      resources :locations, only: [:create]
      resources :merchant, only: [:index]
      resources :authentication, only: [:create]
    end
  end

  apipie
  devise_for :users
  ActiveAdmin.routes(self)

  root 'pages#consumers'
end
