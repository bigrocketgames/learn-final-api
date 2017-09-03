class SubSport < ApplicationRecord
  belongs_to :sport

  validates :name, presence: true, uniqueness: true
  validates :sport_id, :conference_split, presence: true
end
