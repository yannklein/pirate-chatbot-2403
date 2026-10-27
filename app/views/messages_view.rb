class MessagesView
  def display_list(messages)
    messages.each do |message|
      icon = message.role == "user" ? "🤓" : "🦜"
      puts "(#{icon}) #{message.content}\n\n"
    end
  end

  def ask_for_input
    puts "Your message?"
    print "> "
    gets.chomp
  end
end