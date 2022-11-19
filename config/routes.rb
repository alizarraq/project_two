Rails.application.routes.draw do
  resources :orders
   root "pages#home"
end
