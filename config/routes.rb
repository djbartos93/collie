Rails.application.routes.draw do
  root to: "assets#index"
  resources :assets
  resources :users
end
