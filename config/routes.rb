Rails.application.routes.draw do
  resources :restaurant
  root 'application#home'
end
