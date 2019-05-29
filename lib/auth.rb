require 'JWT'

class Auth

    def self.create_token(user_object)
        payload = { user: user_object }
        JWT.encode(payload, ENV["AUTH_SECRET"], ENV["AUTH_ALGORITHM"]) 
        binding.pry
    end

    def self.decode_token(token)
        body = JWT.decode(token, ENV["AUTH_SECRET"], true, { algorithm: ENV["AUTH_ALGORITHM"] })
        HashWithIndifferentAccess.new(body)
    end

end