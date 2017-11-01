class User < ApplicationRecord

    has_many :videos
    
    has_secure_password

    validates :email, :username, presence: true
    validates :email, :username, uniqueness: true

end
