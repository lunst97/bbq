Rails.application.routes.draw do
  resources :photos
  resources :subscriptions
  resources :comments

  devise_for :users

  resources :users, only: [:show, :edit, :update]

  resources :events do
    resources :comments, only: [:create, :destroy]
    resources :subscriptions, only: [:create, :destroy]
    resources :photos, only: [:create, :destroy]
  end

  root "events#index"
end
