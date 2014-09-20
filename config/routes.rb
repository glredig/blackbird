Rails.application.routes.draw do
  devise_for :users
  get "home/index"
  get "/samples", to: 'samples#index'

  root to: 'home#index'

  resources :events
  resources :songs
  resources :bios
  resources :reviews
  resources :slides

  namespace :apis do
    post 'email/subscribe'
  end
end
