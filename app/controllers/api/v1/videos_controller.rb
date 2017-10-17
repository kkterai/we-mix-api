require 'Auth'

class Api::V1::VideosController < ApplicationController

    def index
        # token=request.env["HTTP_AUTHORIZATION"]
        # if token && Auth.decode_token(token)
        #     render json: Video.all
        # else 
        #     render json: { error: { message: 'You must have a valid token' }}, status: 500
        # end
        @videos = Video.all
        render json: @videos, status: 200
    end

    def show
        
    end

    def create
        video = Video.new(video_params)
        if video.save
            render json: , status: 201
        end
    end

    def destroy

    end

    private

    def video_params
        params.require()
    end

end