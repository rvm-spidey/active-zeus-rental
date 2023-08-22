Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  # Define your application routes per theww DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get 'bookings/create'
  # get 'bookings/destroy'

  resources :fitness_equipments do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings
end
