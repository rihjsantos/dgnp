class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    has_secure_password
    validates :name, presence: true, length: { minimum: 5, maximum: 255 }
    validates :password, presence: true, length: { minimum: 5 }
    validates :password_digest, presence: true, length: { maximum: 255 }
end