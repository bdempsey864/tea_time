require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it {should belongs_to(:tea)}
  it {should belongs_to(:customer)}
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:price)}
  it {should validate_presence_of(:status)}
  it {should validate_presence_of(:frequency)}
end
