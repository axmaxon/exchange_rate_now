class ExchangeRateService
  include HTTParty

  base_uri 'http://www.cbr.ru/scripts/XML_daily.asp'

  class << self
    def call
      rate = fetch_actual_rate
      save_rate_to_database(rate)
    end

    private

    def fetch_actual_rate
      date = Date.today.strftime('%d/%m/%Y')
      response = get("?date_req=#{date}")

      doc = Nokogiri::XML(response.body)
      rate = doc.xpath('//Valute[CharCode="USD"]/Value').text

      rate.to_f
    end

    def save_rate_to_database(rate)
      ExchangeRate.create(rate: rate)
    end
  end
end
