Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  # Define your application routes per theww DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get 'bookings/create'
  # get 'bookings/destroy'

  # get "admin", to: "admin#index"
  # delete "admin", to: "admin#destroy"

  resources :admin, only: [:index]

  resources :fitness_equipments do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings do
    member do
      patch 'accept'
      patch 'reject'
    end
  end
end
