class Api::V1::SubscriptionsController < ApplicationController
  def index
    render json: SubscriptionSerializer.new(all_subscriptions)
  end

  def create
    subscription = Subscription.create(subscription_params)
    render json: SubscriptionSerializer.new(subscription), status: 201
  end

  def update
    subscription = Subscription.find(params[:id])
    if valid_update_params?
      subscription.update_attribute(:status, 1)
      render json: SubscriptionSerializer.new(subscription)
    else
      render json: {error: "Invalid status"}, status: 400
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:customer_id, :tea_id, :title, :price, :status, :frequency)
  end

  def all_subscriptions
    Customer.find(params[:customer_id]).subscriptions
  end

  def valid_update_params?
    params[:status] == 1 || params[:status] == 'cancelled'
  end
end