require 'Auth'

class Api::V1::UsersController < ApplicationController

    def signup
        user = User.new(user_params)
        if user.save
            render json: { token: Auth.create_token({ username: user.username, id: user.id, email: user.email }) }
        else
            render json: { errors: user.errors.full_messages }, status: 500
        end
    end

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find_by(id: params[:id])
        render json: user
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email)
    end
end