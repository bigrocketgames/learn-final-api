class Message < ApplicationRecord
  belongs_to :chat_room
  belongs_to :user

  validates :content, :chat_room_id, :user_id, presence: true

  after_commit { SendMessageJob.perform_later(self.chat_room, self.user, self) }

  
end
