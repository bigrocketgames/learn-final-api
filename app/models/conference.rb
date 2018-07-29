class Conference < ApplicationRecord
  has_many :teams
  belongs_to :sub_sport
end
