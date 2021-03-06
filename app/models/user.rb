class User < ApplicationRecord
  has_secure_password
  has_many :messages, dependent: :destroy
  has_many :user_teams, dependent: :destroy
  has_many :favorite_teams, through: :user_teams, source: :team

  before_save :downcase_email
  validates :email, :username, presence: true, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  private

  def downcase_email
    self.email = self.email.delete(' ').downcase
  end

end
