class User < ActiveRecord::Base
	before_save { self.email = email.downcase }

	has_secure_password
	validates :password, presence: true, length: { minimum: 5 }
end