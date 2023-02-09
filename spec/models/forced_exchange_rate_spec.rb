require 'rails_helper'

RSpec.describe ForcedExchangeRate, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:rate) }
    it { should validate_numericality_of(:rate) }
    it { should allow_values('123', '0.12', '12.12', '123456.1234').for(:rate) }
    it { should_not allow_values('1234567.12,', 'Some string').for(:rate) }
    it { should validate_presence_of(:expiration_datetime) }
  end

  describe 'database columns' do
    it { should have_db_column(:rate).of_type(:decimal) }
    it { should have_db_column(:expiration_datetime).of_type(:datetime) }
  end

  describe '.current' do
    context 'when last rate with an expiration datetime in the future' do
      let!(:first_valid_rate) { create(:forced_exchange_rate, expiration_datetime: 1.day.since) }
      let!(:second_valid_rate) { create(:forced_exchange_rate, expiration_datetime: 2.day.since) }

      it 'returns the most recent rate with an expiration datetime in the future' do
        expect(ForcedExchangeRate.current).to eq(second_valid_rate)
      end
    end

    context 'when rate with an expiration datetime in the past' do
      let!(:expired_rate) { create(:forced_exchange_rate, expiration_datetime: 1.day.ago) }

      it 'ignores rates with an expired expiration datetime' do
        expect(ForcedExchangeRate.current).to_not eq(expired_rate)
      end
    end
  end
end
