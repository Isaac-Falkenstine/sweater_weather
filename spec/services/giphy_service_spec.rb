require 'rails_helper'

describe "Giphy Service", type: :service do

  before(:each) do
    stub_request(:get, /api.giphy.com/).
    to_return(body: File.read("./spec/fixtures/giphy_service.json"))
  end

  it "returns forcast for a location" do
    summary = "Rainy Day"
    service = GiphyService.new(summary)

    expect(service.gif).to eq("https://giphy.com/gifs/animation-art-illustration-3ov9k22S4De372LQf6")
    expect(service.summary).to eq("Rainy Day")
  end
end
