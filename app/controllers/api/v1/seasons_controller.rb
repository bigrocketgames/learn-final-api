class Api::V1::SeasonsController < ApplicationController

  def index
    @seasons = Season.all
    render 'seasons/index.json.jbuilder', seasons: @seasons
  end

end