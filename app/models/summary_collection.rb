class SummaryCollection
  attr_reader :service,
              :summaries

  def initialize(service)
    @service = service
    @summaries = make_summaries
  end

  def make_summaries
    service.weekly_forcast.map do |day|
      day[:summary]
    end
  end
end
