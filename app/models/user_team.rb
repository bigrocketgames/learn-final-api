class UserTeam < ApplicationRecord
  belongs_to :user
  belongs_to :team

  validates :user_id, :team_id, presence: true
end
