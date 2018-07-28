namespace :import do

  desc "Import teams from csv"
  task teams: :environment do
    filename = File.join Rails.root, "teams.csv"
    CSV.foreach(filename, headers: true) do |row|
      team_hash = row.to_h
      team_hash["sub_sport_id"] = team_hash["sub_sport_id"].to_i
      team_hash["stadium_location"] = team_hash["stadium_location"].split(" ").join(", ")
      team = Team.find_by(name: team_hash["name"], mascot: team_hash["mascot"])
      if (!team) 
        team = Team.create(team_hash)
        p "When trying to create a new team of #{row['name']}, we got the following errors - #{team.errors.full_messages.join(",")}" if team.errors.any?
      else
        team.update(team_hash)
        p "When trying to update #{row['name']}, we got the following errors - #{team.errors.full_messages.join(",")}" if team.errors.any?
      end
    end
  end
end