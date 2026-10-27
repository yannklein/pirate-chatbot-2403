class Message
  attr_reader :content, :role

  def initialize(attributes = {})
    @content = attributes[:content]
    @role = attributes[:role]
  end
end