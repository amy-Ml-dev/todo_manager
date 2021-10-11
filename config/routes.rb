Rails.application.routes.draw do
  get "/" => "home#index"
  resources :users
  post "users/login", to: "users#login"
  resources :todos
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
end
