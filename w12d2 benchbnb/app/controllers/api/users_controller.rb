class Api::UsersController < ApplicationController
    
    before_action :require_current_user!, except: [:create, :new]

    def create 
        @user = User.new(user_params)
        debugger
        if @user.save
            debugger
            login!(@user)
            debugger
            render "api/users/show"
        else
            debugger
            render json: @user.errors.full_messages
        end 
    end 

    def new
        @user = User.new
        debugger
    end 


    private 

    def user_params
        debugger
        params.require(:user).permit(:username, :password)
    end 
end
