class User < ActiveRecord::Base
  has_many :lists
  before_create :generate_auth_token

  def full_name
    "#{self.first_name}" + " " + "#{self.last_name}"
  end

  def generate_auth_token
     loop do
       self.auth_token = SecureRandom.base64(64)
       break unless User.find_by(auth_token: auth_token)
     end
   end
end
