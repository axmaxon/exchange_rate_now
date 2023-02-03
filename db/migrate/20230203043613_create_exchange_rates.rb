class CreateExchangeRates < ActiveRecord::Migration[6.1]
  def change
    create_table :exchange_rates do |t|
      t.decimal :rate, precision: 6, scale: 4, null: false
      t.timestamps
    end
  end
end
