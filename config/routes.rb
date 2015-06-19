Rails.application.routes.draw do
  get 'carts/my_cart', as: :my_cart

  get 'products/search', as: :products_search

  resources :contacts, only:[:create, :new, :index]
  resources :news_item, only:[:show, :index], path: 'news'
  resources :categories, only:[:show]
  resources :products, only: [:show]
  resources :line_items, only: [:create, :destroy, :update, :index]
  post 'line_items/create_in_product', as: :create_line_items_in_product
  root to: 'news_item#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)
end
