require 'Auth'

class Api::V1::VideosController < ApplicationController
    
        before_action :set_video, only: [:show, :update, :destroy]
        before_action :set_user, only: [:index, :create]

        def index
            if @token && @user_id
                user = User.find_by(id: @user_id)
                render json: user.videos
            else 
                render json: { error: { message: 'You must have a valid token' }}, status: 500
            end
        end

        def create
            @video = Video.new(video_params)
            @video.build_user
            @video.user = User.find_by(id: @user_id)
            if @video.save
                render json: @video, status: 201
            else
               render_errors_in_json 
            end
        end
    
        def show
            if @video
                render json: @video, status: 200
            end
        end
    
        def update
            binding.pry
            if @video.update(video_params)
                render json: @video
            else
               render_errors_in_json
            end
        end
    
        def destroy
            @video.destroy
            :no_content
        end
    
        private

        def set_user
            if request.authorization
                @token=request.authorization
                @user_id= Auth.decode_token(@token)[0]["user"]["id"]
            else 
                render json: { error: { message: 'You must have a valid token' }}, status: 500
            end
        end

        def render_errors_in_json
            render json: { 
                errors: { 
                    messages: @video.errors.messages 
                } 
            }, status: 422
        end
    
        def set_video
            @video = Video.find_by(id: params[:id])
            if !@video
                render json: { 
                    errors: { 
                        messages: { video: "Can't be found" } 
                    } 
                }, status: 404
            end
        end

        def video_params
            params.require(:video).permit(:video_URL, :track_title, :artist, :id)
        end
    
    end
