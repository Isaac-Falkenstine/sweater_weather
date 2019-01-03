class Api::V1::ForecastController < ApplicationController

  def index
    render json: Forecast.all
  end
end
