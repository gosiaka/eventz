Rails.application.routes.draw do

  root "events#index"

  resources :users, only: [:index, :show, :create]
  get "signup" => "users#new"  # tworzymy custom route 'signup' dla akcji 'new' dla users

  resources :events do
    resources :registrations, only: [:index, :new, :create]
  end
end
