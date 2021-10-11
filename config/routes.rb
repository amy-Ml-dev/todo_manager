Rails.application.routes.draw do
  get "/", to: "home#index"
  resources :users
  post "users/login", to: "users#login"
  resources :todos
end
