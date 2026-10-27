class MessagesRouter
  def initialize(messages_controller)
    @messages_controller = messages_controller
    @running = true
  end

  def run
    puts "Ahoy! Welcome aboard the Codebeard chatbot."
    while @running
      display_actions
      user_choice = gets.chomp.to_i
      route_actions(user_choice)
    end
  end

  def route_actions(user_choice)
    case user_choice
    when 1 then @messages_controller.list
    when 2 then @messages_controller.add
    when 3 then @running = false
    end
  end

   def display_actions
    puts ""
    puts "What do you want to do next?"
    puts "1 - List the conversation"
    puts "2 - Send a message"
    puts "3 - Stop and exit"
  end
end