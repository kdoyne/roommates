class EventsController < ApplicationController

def index
  @events = Event.order("date").all
  respond_to do |format|
    format.html { render :index }
    format.json { render json: @events }
  end
end

def show

end

def create
  @event = Event.new(event_params)
  @event.user_id = current_user.id

  if @event.save
    render json: @event
  else
    render status: 400, nothing: true
  end
end

def update
end

def destroy
  @event = Event.find(params[:id])

  if @event.destroy 
    render json: {}
  else
    render status: 400, nothing: true
  end
end

private

  def event_params
    params.require(:event).permit(:title, :date, :time)
  end

end