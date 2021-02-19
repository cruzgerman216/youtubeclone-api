class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    user["subCount"] = user.subs.count;
    render json: user.to_json(:include => [:subs, :subscriptions])
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:id] = user.id
      render json: {status: 201, user: user, logged_in: true}
    else
      render json: {status: 401, message: "Wrong email or password", logged_in: false}
    end
  end

  def update

  end

  def destroy
    user.destroy
  end

  private
    def set_user
      user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :firstname, :lastname, :email, :password, :description, :image, :banner)
    end
end
