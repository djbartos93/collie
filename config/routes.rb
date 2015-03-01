Rails.application.routes.draw do
  get 'dashboard/index'

  concern :paginatable do
    get '(page/:page)', :action => :index, :on => :collection, :as => ''
  end

  root to: "dashboard#index"

  resources :assets, :concerns => :paginatable do
    member do
      get 'print', to: 'assets#print_label'
      post 'new_tag', to: 'assets#new_tag'
    end
  end

  resources :users, :concerns => :paginatable
  resources :rentals, :concerns => :paginatable
  resources :sessions, only: [:new, :create, :destroy]

  get 'search/index'
  post 'search/query'

  namespace :settings do
    root to: 'index#index'

    resources :types, only: [:create, :destroy]
    resources :states, only: [:create, :destroy]
    resources :manufacturers, only: [:create, :destroy]
  end
end
