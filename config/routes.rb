Rails.application.routes.draw do
  root "pages#home"
  resources :users, expect: [:new] 
  resources :orders
  get 'signup', to: 'users#new'
  get 'signup/worker', to: 'users#newworker', as: 'signup_worker'
  post 'signup/worker', to: 'users#create_worker'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy]
  resources :comments, only: [:update]
  resources :orders do
    resources :comments, only: [:create]
  end
  resources 'active_orders', except: [:new, :create]
end
