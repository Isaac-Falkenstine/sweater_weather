class Gifs

  attr_reader :id,
              :daily_forecasts,
              :location,
              :copyright

  def initialize(location)
    @location = location
    @id = darksky_service.right_now_forcast[:time]
    @daily_forecasts = make_days
    @copyright = "2018"
  end

  def location_coords
    GeocodeService.new(location).coords
  end

  def darksky_service
    DarkSkyService.new(location_coords[:lat], location_coords[:lng])
  end

  def times
    @times ||= darksky_service.weekly_forcast.map do |day|
      day[:time]
    end
  end

  def summaries
    @summaries ||= darksky_service.weekly_forcast.map do |day|
      day[:summary]
    end
  end

  def gif_urls
    @gif_urls ||= summaries.map do |summary|
      GiphyService.new(summary).url
    end
  end

  def make_days
    times
    summaries
    gif_urls
    5.times.collect do |int|
      {time: @times[int],
       summary: @summaries[int],
       url: @gif_urls[int]
      }
    end
  end
end
