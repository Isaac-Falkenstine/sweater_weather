class Api::V1::ForecastController < ApplicationController

  def index

    # service = GeocodeService(params[:location])

    render json: Forecast.all
  end
end
