class User < ActiveRecord::Base
  validates :name, :email, :encrypted_password, :presence => true
  
  def password
  end
  
  def password=(password)
    self.password_salt = Digest::SHA1.hexdigest Time.now.to_s
    self.encrypted_password = Digest::SHA1.hexdigest password_salt + password
  end
end
