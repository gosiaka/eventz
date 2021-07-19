Rails.application.routes.draw do

  root "events#index"

  resources :events do
    resources :registrations, only: [:index, :new, :create]
    resources :likes, only: [:create]
  end

  resources :users, only: [:index, :show, :create, :edit, :update, :destroy]
  get "signup" => "users#new"  # tworzymy custom route 'signup' dla akcji 'new' dla users

  resource :session, only: [:new, :create, :destroy] # dla jednej sesji - liczba pojedyncza
  
  
end
