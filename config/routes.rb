Rails.application.routes.draw do

  root "welcome#index"

  resources :users, only: [:create] do
    get "/dashboard", to: "users#show"
    resources :friendships, only: [:create]
  end
  get "/registration", to: "users#new"

  post "/login", to: "sessions#create"

  resources :movies, only: [:index]
  get "/discover", to: "movies#discover"

end
