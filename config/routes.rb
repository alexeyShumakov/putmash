Rails.application.routes.draw do
  get 'contact/new'

  get 'contact/create'

  resources :news_item, only:[:show, :index], path: 'news'
  root to: 'news_item#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
