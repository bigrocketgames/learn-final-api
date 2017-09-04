require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    
    it 'requires an email and password upon creation' do
      user = build(:user, email: nil, password: nil)

      expect(user.valid?).to eq(false)
      expect(user.errors.full_messages).to eq([
        "Password can't be blank",
        "Email can't be blank", 
        "Email is invalid"
      ])
    end
    
    it 'requires that an email is unique' do
      create(:user)
      user = build(:user)

      expect(user.valid?).to eq(false)
      expect(user.errors.full_messages).to eq([
        "Email has already been taken"
      ])
    end
    
    it 'requires that an email is valid (contains an @ symbol and a (.com, .org, etc...)' do
      user1 = build(:user, email: "test.com")
      user2 = build(:user, email: "test@test")
      user3 = build(:user, email: "test")

      expect(user1.valid?).to eq(false)
      expect(user2.valid?).to eq(false)
      expect(user3.valid?).to eq(false)
    end
    
  end
    
  describe 'on save' do

    it 'hashes a password' do
      user = build(:user)
      user.save

      expect(user.password_digest).not_to eq(user.password)
    end

  end

  describe 'relationships' do
    
    it 'has many favorite teams' do
      user = create(:user)
      user.favorite_teams.create(name: "wsu", mascot: "cougars", sub_sport_id: 1)
      user.favorite_teams.create(name: "uw", mascot: "huskies", sub_sport_id: 1)

      expect(user.favorite_teams.length).to eq(2)
    end
    
  end
end
