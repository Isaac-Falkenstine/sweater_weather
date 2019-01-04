class Forecast < ApplicationRecord
  attr_reader :id,
              :location

  def initialize(location)
    @location = location
    @id = service.right_now_forcast[:time]
  end

  def location_coords
    @coordinates ||= GeocodeService.new(@location).coords
  end

  def current_weather
    service.right_now_forcast
  end

  def hourly_weather
    service.hourly_forcast
  end

  def weekly_weather
    service.weekly_forcast
  end

  def service
    @forecast_data ||= DarkSkyService.new(location_coords[:lat],location_coords[:lng])
  end
end
