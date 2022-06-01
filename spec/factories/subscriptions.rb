FactoryBot.define do
  factory :subscription do
    customer
    tea
    title { "My #{Faker::Tea.variety} Subscription" }
    price { 5.75 }
    status { [0, 1].sample }
    frequency { [0, 1, 2].sample }
  end
end