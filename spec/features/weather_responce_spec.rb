require "rails_helper"

describe 'As a visitor' do
  it 'I can see the information for my area' do
    
    visit '/api/v1/forecast?location=denver,co'

    expect(page).to have_content("Please check your email and password information")
  end
end
