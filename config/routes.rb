Rails.application.routes.draw do
  get 'users/private_office', as: :private_office
  get 'users/orders', as: :user_orders
  get 'carts/my_cart', as: :my_cart

  get 'products/search', as: :products_search
  get 'products/about', as: :products_about

  resources :user_reviews, only:[:index, :create]
  resources :contacts, only:[:create, :new, :index]
  resources :news_item, only:[:show, :index], path: 'news'
  resources :categories, only:[:show]
  resources :products, only: [:show]
  resources :line_items, only: [:create, :destroy, :update, :index]
  resources :orders, only: [:new, :create, :show]
  post 'line_items/create_in_product', as: :create_line_items_in_product
  root to: 'news_item#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)
end
