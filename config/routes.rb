Rails.application.routes.draw do
  resources :restaurant
  resources :restaurant do
    resources :review, only: [:index, :new, :create]
  end
  root 'application#home'

end
