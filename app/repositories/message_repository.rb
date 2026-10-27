class MessageRepository
  def initialize
    @messages = []
  end

  def all
    @messages
  end

  def create(new_message)
    @messages << new_message
  end
end