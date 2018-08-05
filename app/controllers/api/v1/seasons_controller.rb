class Api::V1::SeasonsController < ApplicationController

  def index
    @seasons = Season.all.order(:id)
    render 'seasons/index.json.jbuilder', seasons: @seasons
  end

end