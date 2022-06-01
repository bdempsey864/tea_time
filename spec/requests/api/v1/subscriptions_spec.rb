require 'rails_helper'

RSpec.describe 'Subscription Controller' do
  it 'creates a subscription' do
    customer = create(:customer)
    tea = create(:tea)
    subscription_params = { 
      customer_id: customer.id,
      tea_id: tea.id,
      title: tea.title,
      price: 5.35,
      status: 'active',
      frequency: 'monthly'
     }
     post api_v1_subscriptions_path, params: JSON.generate(subscription_params)
     require "pry"; binding.pry
     expect(response).to be_successful
  end
end