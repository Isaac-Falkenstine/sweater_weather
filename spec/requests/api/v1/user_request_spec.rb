require 'rails_helper'

describe 'making a user api and response' do

  it '/api/v1/users' do
    post '/api/v1/users?email=email_address@example.com&password=password&password_confirmation=password'

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:attributes][:api_key]).to eq(User.last[:api_key])
    expect(User.last.email).to eq('email_address@example.com')
  end

  it '/api/v1/sessions' do
    post '/api/v1/users?email=email_address@example.com&password=password&password_confirmation=password'
    post '/api/v1/sessions?email=email_address@example.com&password=password'

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:attributes][:api_key]).to eq(User.last[:api_key])
  end

  it '/api/v1/sessions failure' do
    post '/api/v1/users?email=email_address@example.com&password=password&password_confirmation=password'
    post '/api/v1/sessions?email=email.wrong.com&password=password'

    parsed = JSON.parse(response.body)

    expect(parsed["error"]).to eq("Something went wrong! Please try again.")
  end
end
