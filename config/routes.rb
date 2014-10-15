Rails.application.routes.draw do
  concern :paginatable do
    get '(page/:page)', :action => :index, :on => :collection, :as => ''
  end


  root to: "assets#index"
  resources :assets, :concerns => :paginatable
  resources :users, :concerns => :paginatable
  resources :rentals, :concerns => :paginatable
  resources :sessions, only: [:new, :create, :destroy]
end
