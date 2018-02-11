class Game < ApplicationRecord
  has_one :chatRoom
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"

  after_create :add_location
  validates :game_time, :home_team_id, :away_team_id, presence: true
  validate :no_duplicate

  private

  def no_duplicate
    if self.location.nil?
      gameExists = Game.where('home_team_id = ? AND away_team_id = ? AND game_time = ?', self.home_team_id, self.away_team_id, self.game_time).count
    else
      gameExists = Game.where('home_team_id = ? AND away_team_id = ? AND game_time = ? AND location = ? ', self.home_team_id, self.away_team_id, self.game_time, self.location).count
    end
    
    if gameExists > 0
      errors.add(:id, "Can't create duplicate games.")
    end
  end

  def add_location
    self.update(location: self.home_team.stadium_location) if self.location.nil?
  end

end
