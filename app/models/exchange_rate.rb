class ExchangeRate < ApplicationRecord
  validates :rate, presence: true, numericality: true, format: { with: /\A\d+(?:\.\d{0,4})?\z/ }

  def self.current_rate
    forced_exchange_rate = ForcedExchangeRate.current

    forced_exchange_rate ? forced_exchange_rate.rate : last&.rate
  end
end
