require 'rails_helper'

describe "Dark Sky Service", type: :service do

  before(:each) do
    stub_request(:get, /api.darksky.net/).
    to_return(body: File.read("./spec/fixtures/dark_sky_service.json"))
  end

  it "returns forcast for a location" do
    service = DarkSkyService.new(39.7392358, -104.990251)

    result_1 = service.hourly_forcast
    result_2 = service.weekly_forcast
    result_3 = service.right_now_forcast


    expect(result_1.count).to eq(8)
    expect(result_1.first[:apparentTemperature]).to eq(48.53)

    expect(result_2.count).to eq(5)
    expect(result_2.first[:temperatureHigh]).to eq(55.38)

    expect(result_3[:apparentTemperature]).to eq(48)
  end
end
