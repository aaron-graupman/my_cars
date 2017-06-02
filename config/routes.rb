Rails.application.routes.draw do
  devise_for :users
  # localhost:3000
  root 'cars#index'

  resources :cars
end
