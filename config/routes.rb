Rails.application.routes.draw do
  resources :accounts do
    collection { post :import }
  end
  resources :recodes
  resources :categories

  get 'articles/show'
  resources :articles do
    get 'import', :on => :collection
  end
  # devise
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: 'accounts#index', as: :authenticated_root
    end

    unauthenticated do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end
end