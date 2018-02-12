class SubSport < ApplicationRecord
  belongs_to :sport
  has_many :teams

  validates :name, uniqueness: true
  validates :name, :sport_id, :conference_split, presence: true
end
