Rails.application.routes.draw do
  get 'products/search', as: :products_search

  resources :contacts, only:[:create, :new, :index]
  resources :news_item, only:[:show, :index], path: 'news'
  resources :categories, only:[:show]
  resources :products, only: [:show]
  root to: 'news_item#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
