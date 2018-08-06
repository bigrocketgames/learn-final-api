namespace :import do

  desc "Import teams from csv"
  task teams: :environment do
    filename = File.join Rails.root, "csv_files/teams.csv"
    CSV.foreach(filename, {col_sep: ";", headers: true}) do |row|
      team_hash = row.to_h
      team_hash["conference_id"] = team_hash["conference_id"].to_i
      team = Team.find_by(id: team_hash["id"])
      if (!team) 
        team = Team.new(team_hash)
        team.save
        p "When trying to create a new team of #{row['name']}, we got the following errors - #{team.errors.full_messages.join(",")}" if team.errors.any?
      else
        team.update(team_hash)
        p "When trying to update #{row['name']}, we got the following errors - #{team.errors.full_messages.join(",")}" if team.errors.any?
      end
    end
  end

  desc "Import conferences from csv"
  task conferences: :environment do
    filename = File.join Rails.root, "csv_files/conferences.csv"
    CSV.foreach(filename, {col_sep: ";", headers: true}) do |row|
      conference_hash = row.to_h
      conference_hash["sub_sport_id"] = conference_hash["sub_sport_id"].to_i

      conference = Conference.find_by(id: conference_hash["id"])
      if (!conference)
        conference = Conference.create(conference_hash)
        p "When trying to create a new conference of #{row['name']}, we got the following errors - #{conference.errors.full_messages.join(",")}" if conference.errors.any?
      else
        conference.update(conference_hash)
        p "When trying to update the #{row['name']} conference, we got the following errors - #{conference.errors.full_messages.join(",")}" if conference.errors.any?
      end
    end
  end

  desc "Import sports from csv"
  task sports: :environment do
    filename = File.join Rails.root, "csv_files/sports.csv"
    CSV.foreach(filename, {col_sep: ";", headers: true}) do |row|
      sport_hash = row.to_h
      sport = Sport.find_by(id: sport_hash["id"])
      if (!sport)
        sport = Sport.create(sport_hash)
        p "When trying to create a new sport of #{row['name']}, we got the following errors - #{sport.errors.full_messages.join(",")}" if sport.errors.any?
      else
        sport.update(sport_hash)
        p "When trying to update the #{row['name']} sport, we got the following errors - #{sport.errors.full_messages.join(",")}" if sport.errors.any?
      end
    end
  end

  desc "Import sub sports from csv"
  task sub_sports: :environment do
    filename = File.join Rails.root, "csv_files/subsports.csv"
    CSV.foreach(filename, {col_sep: ";", headers: true}) do |row|
      sub_sport_hash = row.to_h
      sub_sport = SubSport.find_by(id: sub_sport_hash["id"])
      if (!sub_sport)
        sub_sport = SubSport.create(sub_sport_hash)
        p "When trying to create a new sub sport of #{row['name']}, we got the following errors - #{sub_sport.errors.full_messages.join(",")}" if sub_sport.errors.any?
      else
        sub_sport.update(sub_sport_hash)
        p "When trying to update the #{row['name']} sub sport, we got the following errors - #{sub_sport.errors.full_messages.join(",")}" if sub_sport.errors.any?
      end
    end
  end

  desc "Import games from csv"
  task games: :environment do
    filename = File.join Rails.root, "csv_files/games.csv"
    CSV.foreach(filename, {col_sep: ";", headers: true}) do |row|
      game_hash = row.to_h
      game_hash.symbolize_keys!
      game = Game.find_by(id: game_hash[:id])

      game_hash.delete :id
      p game_hash

      if(!game)
        game = Game.new(game_hash)
        game.save
        p "When trying to create a new game of #{row['name']}, we got the following errors - #{game.errors.full_messages.join(",")}" if game.errors.any?
      else
        game.update(game_hash)
        p "When trying to update game id# #{row['name']}, we got the following errors - #{game.errors.full_messages.join(",")}" if game.errors.any?
      end
    end
  end


end