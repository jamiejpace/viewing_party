Rails.application.routes.draw do

  root "welcome#index"
  resources :users, only: [:create] do
    get "/dashboard", to: "users#dashboard"
  end

  get "/registration", to: "users#new"
  post "/login", to: "users#login"
end
