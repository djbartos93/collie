Rails.application.routes.draw do
  root to: "assets#index"
  resources :assets
  resources :users
  resources :rentals
  resources :sessions, only: [:new, :create, :destroy]
end
