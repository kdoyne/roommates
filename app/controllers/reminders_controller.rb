class RemindersController < ApplicationController

  def index
    @reminders = Reminder.where(event_id: event_id)
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @reminders }
    end
  end

  def create
    @reminder = Reminder.new(reminder_params)
    @reminder.user_id = current_user.id
    @reminder.house_id = current_house.id
    if @reminder.save
      render json: @reminder
    else
      render status: 400, nothing: true
    end
  end

  def destroy
    @reminder = Reminder.find(params[:id])

    if @reminder.destroy 
      render json: {}
    else
      render status: 400, nothing: true
    end
  end

private

  def reminder_params
    params.require(:reminder).permit(:message, :date, :time, :event)
  end
end

