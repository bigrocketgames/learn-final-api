class SendMessageJob < ApplicationJob
  queue_as :default
  
  def perform(chatRoom, user, message)
    MessagesChannel.broadcast_to chatRoom, message: build_message(user, message)
  end

  def build_message(user, message)
    formattedMessage = {id: message.id, content: message.content, username: user.username, createdAt: message.created_at}
  end
end