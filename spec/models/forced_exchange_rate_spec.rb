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
end
