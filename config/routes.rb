Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :customers
  root to: 'homes#top'
  get 'books_search' => 'books#search'
  get 'customers_search' => 'customers#search'
  get 'customers/mypage' => 'customers#mypage'
  get 'customers/like' => 'customers#like'
  resources :favorites, only: %i[create destroy]
  resources :genres, only: %i[create destroy index edit update]
  resources :customers, only: %i[show index edit update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    end

  resources :books do
    resource :favorites, only: %i[create destroy]
    resources :reviews, only: %i[create destroy index edit] do
      resources :likes, only: %i[create destroy]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
