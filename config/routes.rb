Rails.application.routes.draw do
  root 'application#home'

  resources :users
  resources :attractions
  resources :rides, only: [:create]
  resources :sessions, only: [:create, :destroy]
  get '/signin' => 'sessions#new'

end
