class SubSport < ApplicationRecord
  belongs_to :sport
  has_many :conferences, dependent: :destroy

  validates :name, uniqueness: true
  validates :name, :sport_id, presence: true
end
