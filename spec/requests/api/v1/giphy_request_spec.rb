require 'rails_helper'

describe "Giphy API" do
  it "sends a list of forecasts for a location" do
    get '/api/v1/gifs?location=denver,co'

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to have_key(:daily_forecasts)
    expect(parsed[:data][:attributes][:daily_forecasts].first).to have_key(:url)
    expect(parsed[:data][:attributes][:daily_forecasts].first).to have_key(:time)
    expect(parsed[:data][:attributes][:daily_forecasts].first).to have_key(:summary)
  end
end
