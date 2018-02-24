class ChatRoom < ApplicationRecord
  belongs_to :game
  has_many :messages, dependent: :destroy

  validates :roomName, :game_id, presence: true
end
