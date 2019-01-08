class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  has_many :favorites

  has_secure_password

  def key
    SecureRandom.urlsafe_base64(12)
  end

  def favorites_json
    favorites.inject(Hash.new(0)) do |favorites_list, favorite|
      location = favorite.location
      favorites_list[:location] = location
      favorites_list[:forecast] = Forecast.new(location)
      favorites_list
    end
  end
end
