Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :customers
  root to: 'homes#top'
  resources :favorites, only: [:create, :destroy]
  resources :genres, only: [:create, :destroy, :index, :edit, :update]
  resources :customers, only: [:show, :index, :edit, :update]
  resources :books do
   resources :reviews, only: [:create, :destroy, :index, :edit]
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
