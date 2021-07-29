require 'resque/server'
require 'sidekiq/web'

Rails.application.routes.draw do
  resources :photos
  resources :subscriptions
  resources :comments


  mount Sidekiq::Web => '/sidekiq'

  # mount Resque::Server.new, :at => "/resque"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:show, :edit, :update]

  resources :events do
    resources :comments, only: [:create, :destroy]
    resources :subscriptions, only: [:create, :destroy]
    resources :photos, only: [:create, :destroy]

    post :show, on: :member
  end

  root "events#index"
end
