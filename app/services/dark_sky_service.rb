class DarkSkyService

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def conn
    Faraday.new(url: "https://api.darksky.net") do |f|
      f.adapter  Faraday.default_adapter
    end
  end

  def response
    url = "/forecast/#{ENV['DARKSKY_API_KEY']}/#{@latitude},#{@longitude}"
    conn.get(url)
  end

  def hourly_forcast
    JSON.parse(response.body, symbolize_names: true)[:hourly][:data].first(8)
  end

  def weekly_forcast
    JSON.parse(response.body, symbolize_names: true)[:daily][:data].first(5)
  end

  def right_now_forcast
    JSON.parse(response.body, symbolize_names: true)[:currently]
  end
end
