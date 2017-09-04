class UserTeam < ApplicationRecord
  belongs_to :fan, class_name: "User"
  belongs_to :user

  validates :fan_id, :team_id, presence: true
end
