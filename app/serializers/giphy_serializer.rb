class GiphySerializer
  include FastJsonapi::ObjectSerializer

  attribute :daily_forecasts do |day|
    binding.pry
    day
  end
end
