Rails.application.routes.draw do
  devise_for :users
  root  'home#index'

  get 'home/index' => "home#index"

  resources :users, only: [:edit, :update]

end
