Rails.application.routes.draw do
  root "pages#home"
  resources :users, expect: [:new] 
  resources :orders
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

end
