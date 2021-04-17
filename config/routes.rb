Rails.application.routes.draw do
  resources :users, only: [:show, :edit, :update]
  resources :events
  root "events#index"
end
