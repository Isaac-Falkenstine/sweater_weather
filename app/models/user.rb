class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  has_many :favorites

  has_secure_password

  def key
    SecureRandom.urlsafe_base64(12)
  end

  def favorites_json
    favorites.map do |favorite|
      location = favorite.location
      {location: location, current_weather: Forecast.new(location).current_weather}
    end
  end
end
