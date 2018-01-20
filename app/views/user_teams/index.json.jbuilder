json.array! @userTeams do |userTeam|
  json.(userTeam, :id, :user_id)

  json.team userTeam.team, :id, :fullname, :fans
end