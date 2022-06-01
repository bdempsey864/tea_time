# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.destroy_all
Subscription.destroy_all
Tea.destroy_all

customers = FactoryBot.create_list(:customer, 2)
tea1 = FactoryBot.create(:tea)
tea2 = FactoryBot.create(:tea)
tea3 = FactoryBot.create(:tea)
FactoryBot.create(:subscription, frequency: :monthly, customer_id: customers.first.id, tea_id: tea1.id)
FactoryBot.create(:subscription, frequency: :annually, customer_id: customers.first.id, tea_id: tea2.id)
FactoryBot.create(:subscription, frequency: :monthly, customer_id: customers.last.id, tea_id: tea3.id)