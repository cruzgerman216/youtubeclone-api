class SessionsController < ApplicationController
    def create
      user = User.find_by(email: params[:user][:email])

      if user && user.authenticate(params[:user][:password])
        session[:id] = user.id
        render json: {status: 201, user: user.as_json(:include=>[:subs, :subscriptions]), logged_in: true}
      else
        render json: {status: 401, message: "Wrong email or password", logged_in: false}
      end
    end

    def logout 
      reset_session
      render json: {status: 200, user: {}, logged_in: false}
    end

    def logged_in 
      if logged_in?
        user = current_user; 
        render json: {status: 201, user: current_user.as_json(:include=>[:subs, :subscriptions], :except=>[:password_digest]), logged_in: true}
      else
        render json: {status: 400, user: {}, logged_in: false}
      end
    end
  end