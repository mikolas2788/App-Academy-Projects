class ApplicationController < ActionController::Base

    skip_before_action :verify_authenticity_token

    helper_method :current_user

    def require_current_user!
        debugger
        redirect_to new_session_url if current_user.nil?
    end 

    def login!(user)
        @current_user = user
        debugger
        session[:session_token] = user.session_token
    end 
    
    def current_user
        debugger
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(session_token: session[:session_token])
    end 

    def logout!
        current_user.try(:reset_session_token!)
        debugger
        session[:session_token] = nil
    end 

end
