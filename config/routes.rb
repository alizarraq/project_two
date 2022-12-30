Rails.application.routes.draw do
  root "pages#home"
  resources :users, expect: [:new] 
  resources :orders
  get 'signup', to: 'users#new'
  get 'worker/signup', to: 'users#newworker'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy]
end
