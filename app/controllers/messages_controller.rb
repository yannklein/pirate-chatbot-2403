require_relative "../views/messages_view"
require_relative "../models/message"

class MessagesController
  PIRATE_PROMPT = <<~PROMPT
    You are Captain Codebeard, a pirate captain who somehow
    learned to code. Answer every question while staying in
    character: use pirate slang and nautical metaphors, and
    never break character. Keep answers to 3 sentences max.
  PROMPT

  def initialize(message_repository)
    @message_repository = message_repository
    @messages_view = MessagesView.new
    @chat = RubyLLM.chat.with_instructions(PIRATE_PROMPT)
  end

  def list
    # 1. Get messages from the repo
    messages = @message_repository.all
    # 2. Display them in the view
    @messages_view.display_list(messages)
  end

  def add
    # 1. Ask for a question (view)
    input = @messages_view.ask_for_input
    # 2. Create an instance of message
    user_message = Message.new(content: input, role: "user")
    # 3. Store it in the repo
    @message_repository.create(user_message)

    # AI answering
    response = @chat.ask(input)
    
    assistant_message = Message.new(content: response.content, role: "assistant")
    @message_repository.create(assistant_message)
  end
end