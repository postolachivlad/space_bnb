Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "spaceships#index"

  resources :spaceships, except: :index do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:new, :create]
  end

  resources :users, only: [:show, :edit, :update]
end
