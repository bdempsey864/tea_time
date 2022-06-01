class Api::V1::SubscriptionsController < ApplicationController
  def index
    render json: SubscriptionSerializer.new(all_subscriptions)
  end

  def create
    subscription = Subscription.create(subscription_params)
    render json: SubscriptionSerializer.new(subscription), status: 201
  end

  private

  def subscription_params
    params.permit(:customer_id, :tea_id, :title, :price, :status, :frequency)
  end

  def all_subscriptions
    Customer.find(params[:customer_id]).subscriptions
  end
end