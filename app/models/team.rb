class Team < ApplicationRecord
  belongs_to :sub_sport
  has_many :user_teams
  has_many :fans, through: :user_teams, source: :user
  has_many :home_games, class_name: "Game", foreign_key: "home_team_id"
  has_many :away_games, class_name: "Game", foreign_key: "away_team_id"

  after_create :add_fullname
  validates :name, :mascot, :stadium_location, :sub_sport_id, presence: true
  validate :no_duplicate_team

  def get_games
    team_games = Game.where('home_team_id = ? OR away_team_id = ?', self.id, self.id)
  end

  private

  def no_duplicate_team
    teamExists = Team.where('name = ? AND mascot = ? AND sub_sport_id = ? AND fullname = ? AND stadium_location = ?', self.name, self.mascot, self.sub_sport, self.fullname, self.stadium_location).count
    if teamExists > 0
      errors.add(:name, "can't have a duplicate team")
    end
  end

  def add_fullname
    fullName = self.name + " " + self.mascot
    self.update(fullname: fullName)
  end

end
