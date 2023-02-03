class ExchangeRate < ApplicationRecord
  validates :rate, presence: true, numericality: true, format: { with: /\A\d+(?:\.\d{0,4})?\z/ }
end
