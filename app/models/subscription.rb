class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea
  validates :title, :price, :status, :frequency, presence: true
  enum status: [:active, :cancelled] 
  enum frequency: [:weekly, :monthly, :annually]
end
