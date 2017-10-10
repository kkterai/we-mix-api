require 'JWT'
require 'pry'

class Auth

    def self.create_token(user_object)
        payload = { user: user_object }
        JWT.encode(payload, 'myapp', 'HS256')
    end

    def self.decode_token(object)

    end

end