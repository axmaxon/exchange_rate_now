require 'rails_helper'

RSpec.describe ExchangeRateService do
  describe '.call' do
    it 'fetches and saves the current exchange rate' do
      allow(ExchangeRateService).to receive(:fetch_actual_rate).and_return(88.55)
      expect(ExchangeRateService).to receive(:save_rate_to_database).with(88.55)
      ExchangeRateService.call
    end
  end

  describe '.fetch_actual_rate' do
    let(:date) { Date.current.strftime("%d/%m/%Y") }
    let(:response_body) {
      <<-XML
        <?xml version="1.0" encoding="windows-1251"?>
        <ValCurs Date="#{date}" name="Foreign Currency Market">
          <Valute ID="R01235">
            <NumCode>840</NumCode>
            <CharCode>USD</CharCode>
            <Nominal>1</Nominal>
            <Value>77.77</Value>
          </Valute>
        </ValCurs>
      XML
    }
    let(:response) { double(:response, body: response_body) }

    it 'returns the dollar rate' do
      allow(ExchangeRateService).to receive(:get).and_return(response)
      expect(ExchangeRateService.send(:fetch_actual_rate)).to eq 77.77
    end
  end

  describe '.save_rate_to_database' do
    it 'saves the rate to the database' do
      ExchangeRateService.send(:save_rate_to_database, 55.0)
      expect(ExchangeRate.last.rate).to eq(55.0)
    end
  end
end
