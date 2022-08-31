Rails.application.routes.draw do
  resources :products, only: :index
  resources :categories, only: :index
end
