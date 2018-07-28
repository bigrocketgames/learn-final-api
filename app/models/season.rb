class Season < ApplicationRecord
  has_many :games, dependent: :destroy
  
  validates :year, presence: true
end
