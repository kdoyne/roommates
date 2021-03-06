class SmsController < ApplicationController
  require 'date'

  def method
    @client = Twilio::REST::Client.new TWILIO_SID, TWILIO_AUTH_TOKEN
    # format for texts: Title, Date, Time
    @message_body = @client.account.messages.list[0].body
    @message_sender = params[:From][2..11]

    unless @message_sender == "+1"+TWILIO_NUMBER

      unless User.find_by("phone_number = :phone_number", {:phone_number => @message_sender}).nil?

        # finds user and house in database and makes event
        @user = User.find_by("phone_number = :phone_number", {:phone_number => @message_sender})
        @house = House.find_by(id: @user.house_id)

        if @message_body.split(" ")[0] == "Shopping"
          @shopping_list = @house.shoppings.map { |shopping| shopping.item }
          @list = @shopping_list.join(", ")
          reply(@list)

        elsif @message_body.split(" ")[0] == "Purchased"
          name = []
          @message_body.split(" ").each do |item|
            unless item.include?("$") || item.include?("Purchased")
              name.push(item)
            end
          end
          @item = @house.shoppings.find_by(item: name.join(" "))
          amount = @message_body.split(" ").last.gsub("$", "")
          @bill = Bill.new
          @bill.amount = amount
          @bill.user_id = @user.id
          @bill.house_id = @house.id
          @bill.due_date = Date.today.to_s
          @bill.name = name.join(" ")
          @bill.split = @house.users.count
          @bill.save
          @item.purchased = true
          @item.save
          if @bill.created_at != nil
            reply("Marked item as purchased, added to bills")
          else
            reply("Sorry, there was a problem. Go to the website to mark this as purchased.")
          end
        else
          # searches database for events from that house that are on the same date
          if @house.events.find_by(date: @date) == nil
            # get info from message
            @title = @message_body.split(",")[0]
            @date_array = @message_body.gsub(" ","").split(",")[1].split("/")
            @date = @date_array[2]+"/"+@date_array[0]+"/"+@date_array[1]
            @time = @message_body.split(",")[2]

            # creates event
            @event = Event.new
            @event.user = @user
            @event.title = @title
            @event.date = @date
            @event.time = @time
            @event.house = @user.house
            @event.save
            if @event.created_at != nil
                # if event is created 
              reply("confirmed!")
            else
              # if event could not be saved
              reply("Please try again")
            end
          else 
            # if there is an event on the same date
            reply("There is already an event on that date")
          end
        end
      else
        # sends if a phone number is not found in the database.
        reply("Please go online to register for RoommateHub.")
      end
    end
  end

# sets up template for replies from twilio
  def reply(message)
    number_to_send_to = @message_sender
    @twilio_client = Twilio::REST::Client.new TWILIO_SID, TWILIO_AUTH_TOKEN
    @twilio_client.account.messages.create(
      :from => "+1#{TWILIO_NUMBER}",
      :to => @message_sender,
      :body => "#{message}"
      )
  end

  def remind(reminder)
    users_to_send_to = User.where(house_id: event.house_id)
    users_to_send_to.each do |user|
      @twilio_client = Twilio::REST::Client.new TWILIO_SID, TWILIO_AUTH_TOKEN
      @twilio_client.account.messages.create(
        :from => "+1#{TWILIO_NUMBER}",
        :to => user.phone_number,
        :body => event.title
        )
    end
  end

  def send_reminders
    @reminders = Event.where(date: Date.tomorrow)
    @reminders.each do |reminder|
      if reminder.remind == true  
        remind(reminder)
      end
    end
  end

end