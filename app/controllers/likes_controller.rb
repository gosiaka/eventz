class LikesController < ApplicationController

  before_action :require_sign_in

  def create
    @event = Event.find(params[:event_id])
    @event.likes.create!(user: current_user)
    redirect_to @event
  end
end