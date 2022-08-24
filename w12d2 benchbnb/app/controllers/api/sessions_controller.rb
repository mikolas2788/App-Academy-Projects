class Api::SessionsController < ApplicationController

    def create 
        debugger
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )
        debugger
        if @user
            debugger
            login!(@user)
            debugger
            render "api/users/show"
        else 
            debugger
            render json: ['Credentials are wrong'], status: 401
        end 
    end 

    def destroy 
        debugger
        @user = current_user
        if @user
            debugger
            logout!
            debugger
            render "api/users/show"
        else 
            debugger
            render json: ['Nobody is signed in'], status: 404
        end 
    end 
end
