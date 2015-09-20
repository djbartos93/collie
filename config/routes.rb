Rails.application.routes.draw do
  root to: 'dashboard#index'

  get 'dashboard/index'

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :assets, concerns: :paginatable do
    member do
      get 'print', to: 'assets#print_label'
      post 'new_tag', to: 'assets#new_tag'
    end
  end

  resources :users, concerns: :paginatable do
    collection do
      get 'confirm/:key', to: :confirm, as: 'confirm'
    end
  end

  resources :rentals, concerns: :paginatable
  resources :sessions, only: [:new, :create, :destroy]

  get 'search/index'
  post 'search/query'

  namespace :settings do
    root to: 'index#index'

    resources :types, only: [:create, :destroy]
    resources :states, only: [:create, :destroy]
    resources :manufacturers, only: [:create, :destroy]

    resources :updates, only: [] do
      collection do
        put :rentable_asset_type
        patch :rentable_asset_type
      end
    end
  end
end
