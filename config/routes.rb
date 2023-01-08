Rails.application.routes.draw do
  root "pages#home"
  resources :users, expect: [:new] 
  resources :orders
  get 'signup', to: 'users#new'
  get 'signup/worker', to: 'users#newworker'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy]
  resources :comments, only: [:update]
  resources :orders do
    resources :comments, only: [:create]
  end
  get 'active_orders', to: 'active_orders#index'
end
