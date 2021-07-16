class EventsController < ApplicationController

  before_action :require_sign_in, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]
  
  def index
    @events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      # flash[:notice] = "Event successfully updated!"
      # redirect_to event_path(@event)
      # lub:
      redirect_to @event, notice: "Event successfully updated!"
    else
      render :edit
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: "Event successfully created!"
    else
      render :new
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :price, :starts_at, :capacity, :image_file_name)
  end
end
