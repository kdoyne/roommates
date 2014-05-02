class EventsController < ApplicationController

  def index
    @events = Event.order("date").where(house_id: current_house)
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @events }
    end
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @event.house_id = current_house.id
    if @event.save
      render json: @event
    else
      render status: 400, nothing: true
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.remind = true
      @event.remind_on = @event.date - 1
    end
    if @event.update(event_params)
      render json: @event
    else
      render status: 400, nothing: true
    end
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
    params.require(:event).permit(:title, :date, :time, :remind_on, :created_at, :id, :user_id, :house_id, :updated_at)
  end

end