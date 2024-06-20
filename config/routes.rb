Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :datexes do
    resources :bookings, only: %i[new create] do
      resources :payments, only: %i[new create]
    end
    resources :reviews, only: %i[new create]
  end
  resources :bookings, except: %i[new create]
  resources :reviews, only: %i[destroy edit]

  get "up" => "rails/health#show", as: :rails_health_check
end
