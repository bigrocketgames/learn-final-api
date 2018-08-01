class Api::V1::ConferencesController < ApplicationController

  def index
    @conferences = Conference.all
    render '/conferences/index.json.jbuilder', conferences: @conferences
  end

end