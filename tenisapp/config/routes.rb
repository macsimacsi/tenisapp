Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :courts do
    resources :bookings, only: [:new, :create, :edit, :update]
  end

  resources :bookings, only: [:destroy]

  delete 'profile', to: 'users#destroy', as: :delete_user_account
  get 'profile', to: 'users#profile'
end
