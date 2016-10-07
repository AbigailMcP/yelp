Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks"}
  resources :restaurant
  resources :restaurant do
    resources :review, only: [:index, :new, :create, :destroy]
  end

  root 'application#home'

end
