require 'rails_helper'

RSpec.describe ExchangeRate, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:rate) }
    it { should validate_numericality_of(:rate) }
    it { should allow_values('123', '0.12', '12.12', '123456.1234').for(:rate) }
    it { should_not allow_values('1234567.12,', 'Some string').for(:rate) }
  end

  describe 'database columns' do
    it { should have_db_column(:rate).of_type(:decimal) }
  end

  describe '.current_rate' do
    let!(:forced_exchange_rate) { create(:forced_exchange_rate, expiration_datetime: 1.day.since) }
    let!(:exchange_rate) { create(:exchange_rate) }

    context 'when forced exchange rate is no expired' do
      it 'returns the rate of the forced exchange rate' do
        expect(ExchangeRate.current_rate).to eq(forced_exchange_rate.rate)
      end
    end

    context 'when forced exchange rate is expired' do
      before do
        forced_exchange_rate.update(expiration_datetime: 1.day.ago)
      end

      it 'returns the rate of the latest exchange rate' do
        expect(ExchangeRate.current_rate).to eq(exchange_rate.rate)
      end
    end
  end
end
