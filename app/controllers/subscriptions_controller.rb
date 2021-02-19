class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]

  def index
    user = User.find_by(params[:id])
    render json: {status: 201, subscriptions: user.subscriptions}
  end

  def subscribers
    user = User.find(params[:user_id])
    render json: {status: 201, subs: user.subs}
  end

  def create
    creator = User.find(params[:creator_id])
    subscriber = User.find(params[:sub_id])
    creator.subs << subscriber
    render json: subscriber.to_json(:include => [:subs, :subscriptions])
  end

  def unsubscribe
    creator = User.find(params[:user_id])
    subscriber = User.find(params[:sub_id])
    subscriber.subscriptions.destroy(creator)
    render json: subscriber.to_json(:include => [:subs, :subscriptions])
  end

  def checksubscription
    user = current_user.subscriptions.find_by(id: params[:user_id]) 
    if user
      render json: {subscribed: true}
    else 
      render json: {subscribed: false}
    end
  end

  private
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    def subscription_params
      params.require(:subscription).permit(:user_id, :sub_id)
    end
end
