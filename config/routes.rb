Yab::Application.routes.draw do

  apipie
  get 'partners', to: 'pages#partners'
  get 'consumers', to: 'pages#consumers'

  root 'pages#consumers'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index, :show]
      resources :authentication, only: [:create]
    end
  end

end
