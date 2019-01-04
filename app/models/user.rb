class User <ApplicationRecord

  def token
    SecureRandom.urlsafe_base64(12)
  end
end
