Rails.application.routes.draw do
  root 'landing#index'

  resources :sessions, only: :create
  resources :users
end
