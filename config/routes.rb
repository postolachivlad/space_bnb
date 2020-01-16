Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  resources :spaceships do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:new, :create]
  end

  resources :users, only: [:show, :edit, :update] do
    resources :bookings, only: [:edit, :update]
  end
end
