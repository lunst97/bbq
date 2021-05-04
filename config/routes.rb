Rails.application.routes.draw do
  resources :subscriptions
  resources :comments

  devise_for :users

  resources :users, only: [:show, :edit, :update]

  resources :events do
    resources :comments, only: [:create, :destroy]
    resources :subscriptions, only: [:create, :destroy]
  end

  root "events#index"
end
