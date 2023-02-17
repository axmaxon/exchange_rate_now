require 'rails_helper'

RSpec.describe GetExchangeRateJob, type: :job do
  describe '#perform' do
    it 'calls the ExchangeRateService' do
      expect(ExchangeRateService).to receive(:call)
      GetExchangeRateJob.perform_now
    end
  end
end
