Rails.application.routes.draw do
  devise_for :users
  get "home/index"
  get "/samples", to: 'samples#index'
  get '/contacts', to: 'contacts#new'

  root to: 'home#index'

  resources :contacts, only: [:new, :create]
  get '/events/archive' => 'events#archive'
  resources :events
  resources :songs
  resources :bios
  resources :reviews
  resources :slides
  resources :media_events, path: "/gallery"
  resources :media_images

  namespace :apis do
    post 'email/subscribe'
  end
end
