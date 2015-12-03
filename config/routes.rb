Rails.application.routes.draw do
  default_url_options host: 'localhost', port: 3000
  resources :sites

  root "sites#index"

  get '/auth/:provider/callback', to: 'sessions#oauth'
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users,
    only: [:new, :create],
    path_names: { new: "signup" }

  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]

end
