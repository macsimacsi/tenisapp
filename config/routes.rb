Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/edit'
  get 'bookings/create'
  get 'bookings/update'
  get 'bookings/destroy'
  get 'courts/index'
  get 'courts/show'
  get 'courts/new'
  get 'courts/edit'
  get 'courts/create'
  get 'courts/update'
  get 'courts/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
