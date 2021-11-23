Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :customers
  root to: 'homes#top'

  resources :favorites, only: %i[create destroy]
  resources :genres, only: %i[create destroy index edit update]
  resources :customers, only: %i[show index edit update] do
    collection do
      get 'search'
      get 'mypage'
      get 'like'
    end
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    end

  resources :books do
    collection do
      get 'search'
      get 'genre_s'
      get 'genre_m'
      get 'genre_z'
      get 'rank'
    end
    resource :favorites, only: %i[create destroy]
    resources :reviews, only: %i[create destroy index edit] do
      resources :likes, only: %i[create destroy]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
