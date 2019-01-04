require 'rails_helper'

describe "Giphy API" do
  it "sends a list of forecasts for a location" do
    get '/api/v1/gifs?location=denver,co'

    expect(response).to be_successful
  end
end
