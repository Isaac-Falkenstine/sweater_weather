class Api::V1::GifsController < ApplicationController

  def index

    render json: GiphySerializer.new(Forecast.new(params[:location]))
  end
end
