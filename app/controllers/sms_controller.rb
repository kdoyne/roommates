class SmsController < ApplicationController

  def method
    @client = Twilio::REST::Client.new TWILIO_SID, TWILIO_AUTH_TOKEN
    @message_body = @client.account.messages.list[0].body
    @message_sender = @client.account.messages.list[0].from
    @title = @message_body.split(",")[0]
    @date = @message_body.split(",")[1]
    @time = @message_body.split(",")[2]

    unless @message_sender == "+1"+TWILIO_NUMBER

      unless User.find_by(phone_number: @message_sender).nil?
        @user = User.find_by(phone_number: @message_sender)
        @event = Event.new
        @event.user = @user
        @event.title = @title
        @event.date = @date
        @event.time = @time
        @event.house = @user.house
        if @event.save? 
          reply("confirmed!")
        else
          reply("Please try again")
        end
      else
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