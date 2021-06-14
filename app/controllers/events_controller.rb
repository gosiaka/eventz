class EventsController < ApplicationController
  def index
    @events = %w(BugSmash Hackathon Kata\ Camp)
  end
end
