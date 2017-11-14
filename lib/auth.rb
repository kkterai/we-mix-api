require 'JWT'

class Auth

    def self.create_token(user_object)
        payload = { user: user_object }
        JWT.encode(payload, 'myapp', 'HS256') 
    end

    def self.decode_token(token)
        JWT.decode(token, 'myapp', true, { algorithm: 'HS256' })
    end

end