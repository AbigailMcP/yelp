Rails.application.routes.draw do
  devise_for :users
  resources :restaurant
  resources :restaurant do
    resources :review, only: [:index, :new, :create, :destroy]
  end

  root 'application#home'

end
