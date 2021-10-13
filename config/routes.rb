Rails.application.routes.draw do

  root "welcome#index"
  resources :users, only: [:new, :create] do
    get "/dashboard", to: "users#dashboard"
  end

  post "/login", to: "users#login"
end
