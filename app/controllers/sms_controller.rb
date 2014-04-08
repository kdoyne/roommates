class SmsController < ApplicationController

  def method
    @client = Twilio::REST::Client.new TWILIO_SID, TWILIO_AUTH_TOKEN
    @message_body = @client.account.messages.list[0].body
    # @message_sender = @client.account.messages.list[0].from
    @message_sender = params[:From][2..11]
    @title = @message_body.split(",")[0]
    @date_array = @message_body.split(",")[1].split("/")
    @date = @date_array[2]+"/"+@date_array[0]+"/"+@date_array[1]
    @time = @message_body.split(",")[2]

    unless @message_sender == "+1"+TWILIO_NUMBER

      unless User.find_by("phone_number = :phone_number", {:phone_number => @message_sender}).nil?

        # finds user and house in database and makes event
        @user = User.find_by("phone_number = :phone_number", {:phone_number => @message_sender})
        @house = House.find_by(id: @user.house_id)

        if @house.events.find_by(date: @date) == nil
          @event = Event.new
          @event.user = @user
          @event.title = @title
          @event.date = @date
          @event.time = @time
          @event.house = @user.house
          @event.save
          if @event.created_at != nil 
            reply("confirmed!")
          else
            reply("Please try again")
          end
        else 
          reply("There is already an event on that date")
        end
      else
        # sends if a phone number is not found in the database.
        reply("Please go online to register for RoommateHub.")
      end
    end
  end

  def reply(message)
    number_to_send_to = @message_sender
    @twilio_client = Twilio::REST::Client.new TWILIO_SID, TWILIO_AUTH_TOKEN
    @twilio_client.account.messages.create(
      :from => "+1#{TWILIO_NUMBER}",
      :to => +17046044609,
      :body => "#{message}"
      )
  end


end