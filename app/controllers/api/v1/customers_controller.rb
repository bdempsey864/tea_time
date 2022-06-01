class Api::V1::CustomersController < ApplicationController
  def index
    render json: CustomersSerializer.new(Customer.all)
  end
end