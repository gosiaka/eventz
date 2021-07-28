class RegistrationsController < ApplicationController

  before_action :require_sign_in

  # self.before_action(:set_event) - met. klasowa
  before_action :set_event # callback

  def index
    @registrations = @event.registrations
  end

  def new
    @registration = @event.registrations.new
  end

  def create
    @registration = @event.registrations.new(registration_params)
    @registration.user = current_user

    if @registration.save
      redirect_to event_registrations_path(@event), notice: "Thanks for registering!"
    else
      render :new
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:how_heard) # strong params
  end

  def set_event
    @event = Event.find_by(slug: params[:event_id])
  end
end
