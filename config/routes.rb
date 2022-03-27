Rails.application.routes.draw do
  devise_for :users
  
  get 'articles/new'
  get 'articles/about'
  root "articles#index"
  resources :articles


end
