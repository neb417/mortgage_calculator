Rails.application.routes.draw do
  root 'landing#index'

  resources :sessions, only: :create
  resources :dashboard, only: :show, controller: 'dashboard'
  resources :users
end
