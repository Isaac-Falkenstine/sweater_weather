class Gif
  attr_reader :location,
              :id,
              :time,
              :url

  def initialize(location)
    @location = location
    @id = darksky_service.right_now_forcast[:time]
    @time = darksky_service.right_now_forcast[:time]
  end

  def location_coords
    GeocodeService.new(location).coords
  end

  def darksky_service
    DarkSkyService.new(location_coords[:lat], location_coords[:lng])
  end

  def summary
    darksky_service.weekly_forcast.map do |day|
      day[:summary]
    end
  end
end
