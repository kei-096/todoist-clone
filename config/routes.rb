Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcomes#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  get "/auth/google_oauth2" => "sessions#create_from_omniauth"

  # get "todos/search" => "todos#search"
  post "todos/search" => "todos#search"

  get "todos/:id/find" => "todos#ajax_find"

  # resources :search, only: [:index]
  # resources :welcome
  # resources :users
  resources :todos
end
