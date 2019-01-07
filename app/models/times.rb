class Times
  attr_reader :times,
              :service

  def initialize(service)
    @service = service
    @times = make_times
  end

  def make_times
    service.weekly_forcast.map do |day|
      day[:time]
    end
  end
end
