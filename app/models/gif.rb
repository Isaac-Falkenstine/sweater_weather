class Gif
  attr_reader :location,
              :id

  def initialize(location)
    @location = location
    @id = DarkSkyService.new(39.7392358, -104.990251).right_now_forcast[:time]
  end

  def summary
    geocode_coords = GeocodeService.new(location).coords

    darksky_service = DarkSkyService.new(geocode_coords[:lat], geocode_coords[:lng])

    darksky_service.weekly_forcast.map do |day|
      day[:summary]
    end
  end
end
