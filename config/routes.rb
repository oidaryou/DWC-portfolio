Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :customers
  root to: 'homes#top'
  get 'customers/mypage' => 'customers#mypage'
  resources :favorites, only: [:create, :destroy]
  resources :genres, only: [:create, :destroy, :index, :edit, :update]
  resources :customers, only: [:show, :index, :edit, :update]
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :reviews, only: [:create, :destroy, :index, :edit] do
    resources :likes, only: [:create, :destroy]
   end
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
