Rails.application.routes.draw do

  root "welcome#index"
  resources :users, only: [:create] do
    get "/dashboard", to: "users#dashboard"
    resources :friendships, only: [:create]
  end

  resources :movies, only: [:index]
  get "/discover", to: "movies#discover"

  get "/registration", to: "users#new"
  post "/login", to: "users#login"
end
