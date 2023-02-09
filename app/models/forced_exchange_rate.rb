class ForcedExchangeRate < ApplicationRecord
  validates :rate, presence: true, numericality: true, format: { with: /\A\d+(?:\.\d{0,4})?\z/ }
  validates :expiration_datetime, presence: true

  def self.current
    where('expiration_datetime > ?', Time.current).last
  end
end
