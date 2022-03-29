Rails.application.routes.draw do
  get 'accounts/index'
  # devise 
  devise_for :users
  # Articels 
  get 'articles/about'
  resources :articles do
  get 'import', :on => :collection
end
  root "articles#index"
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

