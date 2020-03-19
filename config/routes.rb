Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'pages#home'
  resources :adventures do
    resources :bookings, only: [:new, :create] do
      resources :reviews, only: [:new, :create]
    end
  end

  resources :bookings, only: [:index, :show]
end
