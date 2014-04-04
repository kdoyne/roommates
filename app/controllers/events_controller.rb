class EventsController < ApplicationController

def index
  @events = Event.order("date_time").all
  respond_to do |format|
    format.html { render :index }
    format.json { render json: @events }
  end
end

def show

end

def create
  binding.pry
    @event = Event.new(event_params)

  if @event.save
    render json: @event
  else
    render status: 400, nothing: true
  end
end

def update
end

def delete
end

private

  def event_params
    params.require(:event).permit(:title, :date_time)
  end

end