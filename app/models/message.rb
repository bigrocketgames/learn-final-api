class Message < ApplicationRecord
  belongs_to :chat_room
  belongs_to :user

  validates :content, :chat_room_id, :user_id, presence: true
end
