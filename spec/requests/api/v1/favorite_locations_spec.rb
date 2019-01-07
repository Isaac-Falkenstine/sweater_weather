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
    #expect it to throw a 401
  end
end
# render file: 'errors/not_found', status: 401
