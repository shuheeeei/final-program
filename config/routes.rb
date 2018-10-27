Rails.application.routes.draw do
  devise_for :users
  root  'home#index'

  resources :meigens do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:edit, :update]

end
