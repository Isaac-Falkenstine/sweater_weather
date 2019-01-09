class GiphyService

  attr_reader :summary

  def initialize(summary)
    @summary = summary
  end

  def conn
    Faraday.new(url: "https://api.giphy.com/v1/gifs/") do |f|
      f.adapter  Faraday.default_adapter
    end
  end

  def response
    url = "search?api_key=#{ENV['GIPHY_API_KEY']}&q=#{@summary}"
    conn.get(url)
  end

  def gif
    JSON.parse(response.body, symbolize_names: true)[:data].first[:url]
  end
end
