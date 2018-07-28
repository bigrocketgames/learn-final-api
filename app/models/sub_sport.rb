class SubSport < ApplicationRecord
  belongs_to :sport
  has_many :teams, dependent: :destroy

  validates :name, uniqueness: true
  validates :name, :sport_id, :alt_season_display, presence: true
end
