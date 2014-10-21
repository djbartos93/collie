Rails.application.routes.draw do
  get 'dashboard/index'

  concern :paginatable do
    get '(page/:page)', :action => :index, :on => :collection, :as => ''
  end


  root to: "dashboard#index"
  resources :assets, :concerns => :paginatable
  resources :users, :concerns => :paginatable
  resources :rentals, :concerns => :paginatable
  resources :sessions, only: [:new, :create, :destroy]
  get 'search/index'
  post 'search/results'
end
