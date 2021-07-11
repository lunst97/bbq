Rails.application.routes.draw do
  resources :photos
  resources :subscriptions
  resources :comments

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:show, :edit, :update]

  resources :events do
    resources :comments, only: [:create, :destroy]
    resources :subscriptions, only: [:create, :destroy]
    resources :photos, only: [:create, :destroy]

    # Добавляем вот эту строку
    post :show, on: :member
  end

  root "events#index"
end
