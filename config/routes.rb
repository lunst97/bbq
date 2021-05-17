Rails.application.routes.draw do
  resources :photos
  resources :subscriptions
  resources :comments

  devise_for :users

  resources :users, only: [:show, :edit, :update]

  resources :events do
    resources :comments, only: [:create, :destroy]
    resources :subscriptions, only: [:create, :destroy]
    # Вложенные в ресурс события ресурсы фотографий
    resources :photos, only: [:create, :destroy]

    post :show, on: :member
  end

  root "events#index"
end
