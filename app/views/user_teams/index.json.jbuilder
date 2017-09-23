json.array! @userTeams do |userTeam|
  json.(userTeam, :id, :user_id, :team_id)
end