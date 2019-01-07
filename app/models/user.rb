class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true

  has_secure_password

  def key
    SecureRandom.urlsafe_base64(12)
  end
end
