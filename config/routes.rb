Rails.application.routes.draw do
  resources :datexes do
    resources :bookings, only: %i[new create edit]
  end
  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
end
