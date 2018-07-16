Rails.application.routes.draw do
  resources :categories
  resources :images
  resources :shop_statuses
  resources :notices
  resources :bonus
  resources :cards
  resources :customers
  resources :members
  resources :shops
  post :write, to: 'static#write'
  get 'static/index'
  root 'static#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
