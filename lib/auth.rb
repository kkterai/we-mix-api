require 'JWT'

class Auth

    def self.create_token(user_object)
        payload = { user: user_object }
        JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256') 
    end

    def self.decode_token(token)
        body = JWT.decode(token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' })
        HashWithIndifferentAccess.new(body)
    end

end