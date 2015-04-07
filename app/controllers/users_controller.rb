class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @user = User.find_by username: params[:id]

        if @user
            render 'show'
        else
            redirect_to users_path
        end
    end

end