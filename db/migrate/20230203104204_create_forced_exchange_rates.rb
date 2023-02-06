class CreateForcedExchangeRates < ActiveRecord::Migration[6.1]
  def change
    create_table :forced_exchange_rates do |t|
      t.decimal :rate, precision: 6, scale: 4, null: false
      t.datetime :expiration_datetime, null: false
      t.timestamps
    end
  end
end
