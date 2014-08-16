Rails.application.routes.draw do
  devise_for :users
  get "home/index"

  root to: 'home#index'

  resources :events
  resources :songs
  resources :bios
end
