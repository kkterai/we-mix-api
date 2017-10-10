require 'Auth'

class Api::V1::VideosController < ApplicationController

    def index
        token=request.env["HTTP_AUTHORIZATION"]
        if token && Auth.decode_token(token)
            render json: Video.all
        else 
            render json: { error: { message: 'You must have a valid token' }}, status: 500
        end
    end

    def show

    end

end