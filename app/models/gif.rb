class Gif
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def summary
    geocode_coords = GeocodeService(params[:location]).coords
    binding.pry

    weekly_forcast = DarkSkyService(geocode_coords[:lat], geocode_coords[:long])
  end
end
