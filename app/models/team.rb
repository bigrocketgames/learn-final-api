class Team < ApplicationRecord
  belongs_to :sub_sport
  has_many :user_teams
  has_many :fans, through: :user_teams, source: :fan

  after_create :add_fullname
  validates :name, :mascot, :stadium_location, :sub_sport_id, presence: true
  validate :no_duplicate_team

  private

  def no_duplicate_team
    teamExists = Team.where('name = ? AND mascot = ? AND sub_sport_id = ?', self.name, self.mascot, self.sub_sport).count
    if teamExists > 0
      errors.add(:name, "can't have a duplicate team")
    end
  end

  def add_fullname
    fullName = self.name + " " + self.mascot
    self.update(fullname: fullName)
  end

end
