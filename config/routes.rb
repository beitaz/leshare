Rails.application.routes.draw do
  resources :images
  resources :shop_statuses
  resources :notices
  resources :bonus
  resources :cards
  resources :customers
  resources :members
  resources :shops
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
