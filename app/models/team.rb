class Team < ApplicationRecord
  belongs_to :conference
  has_many :user_teams, dependent: :destroy
  has_many :fans, through: :user_teams, source: :user
  has_many :home_games, class_name: "Game", foreign_key: "home_team_id", dependent: :destroy
  has_many :away_games, class_name: "Game", foreign_key: "away_team_id", dependent: :destroy

  after_create :add_fullname
  validates :name, :mascot, :stadium_location, :conference, presence: true
  validate :no_duplicate_team, on: :create

  def get_games
    team_games = Game.where('home_team_id = ? OR away_team_id = ?', self.id, self.id).order(:game_time)
  end

  def fan_count
    self.fans.count
  end

  private

  def no_duplicate_team
    teamExists = Team.where('name = ? AND mascot = ? AND conference_id = ? AND fullname = ? AND stadium_location = ?', self.name, self.mascot, self.conference, self.fullname, self.stadium_location).count
    if teamExists > 0
      errors.add(:name, "can't have a duplicate team")
    end
  end

  def add_fullname
    fullName = self.name + " " + self.mascot
    self.update(fullname: fullName)
  end

end
