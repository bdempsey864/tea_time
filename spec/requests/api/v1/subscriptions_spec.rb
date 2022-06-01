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

  describe 'create a tea subscription' do
    it 'subscribes a customer to a tea subscription' do
      customer = create(:customer)
      tea = create(:tea)
      subscription_params = { 
        subscription: {
          customer_id: customer.id,
          tea_id: tea.id,
          title: tea.title,
          price: 5.35,
          status: 'active',
          frequency: 'monthly'
       }}

      post "/api/v1/customers/#{customer.id}/subscriptions",
      params: subscription_params

      expect(response).to be_successful
    end
  end

  describe 'canceling a subscription' do
    it 'cancels a customers subscription' do
      customer = create(:customer)
      tea = create(:tea)
      subscription = create(:subscription, status: 'active', customer_id: customer.id, tea_id: tea.id)

      patch "/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}", params: {status: 'cancelled'}

      subscription.reload 
      
      expect(response).to be_successful
      expect(subscription.status).to eq('cancelled')
    end

    it 'returns an error if status is not valid' do
      customer = create(:customer)
      tea = create(:tea)
      subscription = create(:subscription, status: 'active', customer_id: customer.id, tea_id: tea.id)

      patch "/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}", params: { status: "chicken wings" }

      expect(response).to_not be_successful
      expect(response).to have_http_status 400
    end
  end
end