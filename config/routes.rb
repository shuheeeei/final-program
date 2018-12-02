Rails.application.routes.draw do
  devise_for :users
  root  'home#index'
  get 'users/:id/likes' => 'likes#show'

  resources :meigens do
    collection do
      get 'contentSearch'
      get 'sourceSearch'
      get 'tagSearch'
    end
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]
  resources :points, only: [:create, :show]

end
