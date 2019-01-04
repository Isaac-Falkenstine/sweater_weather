class Api::V1::ForecastController < ApplicationController

  def index
    render json: ForecastSerializer.new(Forecast.new(params[:location]))
  end
end
