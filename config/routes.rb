Rails.application.routes.draw do

  root "events#index"

  resources :events do
    resources :registrations, only: [:index, :new, :create ]
  end
end
