Rails.application.routes.draw do
  devise_for :users
  resources :restaurant
  resources :restaurant do
    resources :review, only: [:index, :new, :create]
  end
  root 'restaurants#index'

end
