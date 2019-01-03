require 'rails_helper'

describe "Forecast API" do
  it "sends a list of forecasts for a location" do
    create_list(:forecast, 3)

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    forecasts = JSON.parse(response.body)

    expect(forecasts.count).to eq(3)
  end
end
