Rails.application.routes.draw do
  devise_for :users
  root  'home#index'

  resources :meigens

  resources :users, only: [:edit, :update]

end
