Rails.application.routes.draw do
  devise_for :users
  resources :restaurant
  resources :restaurant do
    resources :review, only: [:index, :new, :create, :destroy]
  end

  devise_scope :users do
    get '/' => 'restaurant#index'
  end
  root 'application#home'

end
