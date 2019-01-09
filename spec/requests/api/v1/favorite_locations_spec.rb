require 'rails_helper'

describe 'favorite locations and response' do

  it '/api/v1/favorites' do
    post '/api/v1/users?email=email_address@example.com&password=password&password_confirmation=password'

    parsed = JSON.parse(response.body, symbolize_names: true)

    post "/api/v1/favorites?location=denver,co&api_key=#{parsed[:data][:attributes][:api_key]}"

    expect(response).to be_successful

    expect(User.last.favorites.first.location).to eq("denver,co")
  end

  it '/api/v1/favorites no key' do
    post "/api/v1/favorites?location=denver,co"

    expect(response).not_to be_successful
    expect(status).to eq(401)

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:error]).to eq("Unauthorized")
  end

  it '/api/v1/favorites invaild key' do
    post "/api/v1/favorites?location=denver,co&api_key=ThisIsNOTAVaildKey"

    expect(response).not_to be_successful
    expect(status).to eq(401)

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:error]).to eq("Unauthorized")
  end

  it '/api/v1/favorites' do
    post '/api/v1/users?email=email_address@example.com&password=password&password_confirmation=password'

    parsed = JSON.parse(response.body, symbolize_names: true)

    post "/api/v1/favorites?location=denver,co&api_key=#{parsed[:data][:attributes][:api_key]}"
    post "/api/v1/favorites?location=bolder,co&api_key=#{parsed[:data][:attributes][:api_key]}"

    get "/api/v1/favorites?api_key=#{parsed[:data][:attributes][:api_key]}"

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(parsed.count).to eq(2)
    expect(parsed.first).to have_key(:location)
    expect(parsed.first).to have_key(:current_weather)
    expect(parsed.first[:location]).to eq("denver,co")
  end

  it '/api/v1/favorites with invaild key' do
    post "/api/v1/favorites?location=denver,co&api_key=ThisIsNOTAVaildKey"

    get "/api/v1/favorites?api_key=#{parsed[:data][:attributes][:api_key]}"

    expect(response).not_to be_successful
    expect(status).to eq(401)

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:error]).to eq("Unauthorized")
  end
end
