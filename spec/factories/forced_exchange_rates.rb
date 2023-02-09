FactoryBot.define do
  factory :forced_exchange_rate do
    rate { 70.88 }
    expiration_datetime { 1.day.since }
  end
end
