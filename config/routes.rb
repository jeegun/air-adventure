Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'pages#home'
  resources :adventures do
    resources :bookings, only: [:new, :create]

  end

  resources :bookings, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show] do
    member do
      patch "/accept", to: 'bookings#accept'
      patch "/decline", to: 'bookings#decline'
    end
  end



  get '/dashboard', to: 'pages#dashboard'

end
