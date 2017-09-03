class Sport < ApplicationRecord
  has_many :sub_sports, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
