Rails.application.routes.draw do
  devise_for :users
  resources :restaurant
  resources :restaurant do
    resources :review, only: [:index, :new, :create]
  end
  get '/sign_up', to: 'user#sign_up'
  post '/user', to: 'user#create'
  root 'application#home'

end
