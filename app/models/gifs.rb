class Gifs

  attr_reader :id,
              :daily_forecasts,
              :location,
              :copyright,
              :times,
              :summaries,
              :gif_urls

  def initialize(location)
    @location = location
    @id = darksky_service.right_now_forcast[:time]
    @copyright = "2018"
    @times = Times.new(darksky_service).times
    @summaries = Summaries.new(darksky_service).summaries
    @gif_urls = GifUrls.new(@summaries).gif_urls
    @daily_forecasts = make_days
  end

  def location_coords
    GeocodeService.new(location).coords
  end

  def darksky_service
    DarkSkyService.new(location_coords[:lat], location_coords[:lng])
  end

  def make_days
    5.times.collect do |int|
      {time: times[int],
       summary: summaries[int],
       url: gif_urls[int]
      }
    end
  end
end
