class Gif
  attr_reader :gif_urls,
              :summaries

  def initialize(summaries)
    @summaries = summaries
    @gif_urls = make_gif_urls
  end

  def make_gif_urls
    summaries.map do |summary|
      summary_gsubed = summary.gsub(/[^0-9a-z ]/i, '')
      GiphyService.new(summary_gsubed).gif
    end
  end
end
