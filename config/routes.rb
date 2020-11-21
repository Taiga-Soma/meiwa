Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#index'
  resources :homes do
  end
  resources :users, only: [:show, :update]
end
