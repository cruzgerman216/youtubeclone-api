class ApplicationController < ActionController::Base
    # skip_before_action :verify_authenticity_token
    protect_from_forgery unless: -> { request.format.json? }
    helper_method :logged_in, :current_user

    def logged_in? 
        !!current_user
    end

    def current_user 
        @current_user ||= User.find(session[:id]) if session[:id]
    end
end
