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
        video = Video.find_by(id: params[:id])
        render json: video
    end

    def create
        video = Video.new(video_params)
        if video.save
            render json: video, status: 201
        else
            render json: video, status: 422
        end
    end

    def destroy

    end

    private

    def video_params
        params.require(:video).permit(:uuid, :video_URL, :track_title, :artist, :artist_ID, :playlist_ID )
    end

end