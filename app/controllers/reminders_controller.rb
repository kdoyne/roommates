class RemindersController < ApplicationController

  def index
    @reminders = Reminder.where(event_id: event_id)
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @reminders }
    end
  end

  def new

  end

  def create

  end

  def destroy

  end

end