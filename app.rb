require_relative "config"
require_relative "app/repositories/message_repository"
require_relative "app/controllers/messages_controller"
require_relative "app/routers/messages_router"

message_repository = MessageRepository.new
messages_controller = MessagesController.new(message_repository)
router = MessagesRouter.new(messages_controller)
router.run