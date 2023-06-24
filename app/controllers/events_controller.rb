class EventsController < ApplicationController
  before_action :require_login, except: [:index, :show]

  def index
    @events = Event.all.includes(:creator)

    @events_past = @events.select { |ev| ev.date < Date.today }
    @events_future = @events.select { |ev| ev.date > Date.today }
    @events_today = @events.select { |ev| ev.date == Date.today }
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    # add before_action to limit :new, :create to only logged in users
    @event = current_user.events.build(event_parameters)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new, :status => :unprocessable_entity
    end
  end

  private

    def event_parameters
      params.require(:event).permit(:title, :body, :location, :date)
    end
end
