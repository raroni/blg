class User < ActiveRecord::Base
  def password
  end
  
  def password=(password)
    self.password_salt = Digest::SHA1.hexdigest Time.now.to_s
    self.encrypted_password = Digest::SHA1.hexdigest password_salt + password
  end
end
