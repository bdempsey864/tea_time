require 'rails_helper'

RSpec.describe 'Subscription Controller' do
  describe 'gets all subs for a customer' do
    it 'gets all subs with a valid customer id' do
      customer = create(:customer)
      tea = create(:tea)
      create(:subscription, customer_id: customer.id, tea_id: tea.id)

      get "/api/v1/customers/#{customer.id}/subscriptions"

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to be_a Hash 
      expect(json[:data].count).to eq(1)
      expect(json[:data][0]).to have_key(:id)
      expect(json[:data][0]).to have_key(:type)
      expect(json[:data][0]).to have_key(:attributes)
      expect(json[:data][0][:attributes]).to have_key(:title)
      expect(json[:data][0][:attributes]).to have_key(:price)
      expect(json[:data][0][:attributes]).to have_key(:status)
      expect(json[:data][0][:attributes]).to have_key(:frequency)
    end

    it 'returns an error with invalid customer id' do
      customer = create(:customer)
      tea = create(:tea)
      create(:subscription, customer_id: customer.id, tea_id: tea.id)
      
      get "/api/v1/customers/#{customer.id + 1}/subscriptions"

      expect(response).to_not be_successful
      expect(response).to have_http_status(404)
    end
  end
  #   customer = create(:customer)
  #   tea = create(:tea)
  #   subscription_params = { 
  #     customer_id: customer.id,
  #     tea_id: tea.id,
  #     title: tea.title,
  #     price: 5.35,
  #     status: 'active',
  #     frequency: 'monthly'
  #    }
  #    headers = {"CONTENT_TYPE" => "application/json"}
  #    post api_v1_subscriptions_path, headers: headers, params: subscription_params.to_json
  #    thing = JSON.parse(response.body, symbolize_names: true)
  #    require "pry"; binding.pry
  #    expect(response).to be_successful
  # end
end