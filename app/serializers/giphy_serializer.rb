class GiphySerializer
  include FastJsonapi::ObjectSerializer
  attributes :daily_forecasts
  #            :url,
  #            :summary

  # attribute :daily_forecasts do |day|
  #
  # end
end
