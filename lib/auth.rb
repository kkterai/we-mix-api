require 'JWT'

class Auth

    def self.create_token(user_object)
        payload = { user: user_object }
        JWT.encode(payload, ENV["AUTH_SECRET"], ENV["AUTH_ALGORITHM"]) 
    end

    def self.decode_token(token)
        JWT.decode(token, ENV["AUTH_SECRET"], true, { algorithm: ENV["AUTH_ALGORITHM"] })
    end

end