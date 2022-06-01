class Tea < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  validates :title, :description, :temperature, :brew_time, presence: true
end
