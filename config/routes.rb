Rails.application.routes.draw do

  root "events#index"
  get "events" => "events#index"
  get "events/:id" => "events#show", as: "event" # dodaję helper - nazwę path przez: as:"event"
  get "events/:id/edit" => "events#edit", as: "edit_event"
  patch "events/:id" => "events#update"
end
