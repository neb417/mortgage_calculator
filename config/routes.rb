Rails.application.routes.draw do
  root 'landing#index'

  resources :sessions, only: :create
  resources :dashboard, only: :show, controller: 'dashboard' do
    member do
      get :monthly_payment
    end
  end

  resources :users
end
