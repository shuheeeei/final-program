Rails.application.routes.draw do
  devise_for :users
  root  'home#index'
  get 'users/:id/likes' => 'likes#show'

  resources :meigens do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]


end
