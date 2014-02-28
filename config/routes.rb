Yab::Application.routes.draw do

  get 'partners', to: 'pages#partners'
  get 'consumers', to: 'pages#consumers'

  root 'pages#consumers'

end
