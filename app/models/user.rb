class User <ApplicationRecord

  def key
    SecureRandom.urlsafe_base64(12)
  end
end
