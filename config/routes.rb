Rails.application.routes.draw do
  resources :accounts
  
  # devise 
  devise_for :users
  # Articels 
  get 'articles/about'
  resources :articles do
  get 'import', :on => :collection
  end
  root to: 'articles#index'
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end
end


  # get 'import', :on => :member
  # get 'import2', :on => :member
  # collection do

  #   get 'categoryshow'
  # end

  # member do
  #   get 'categoryshow'
  #   get 'Import'
  # end

