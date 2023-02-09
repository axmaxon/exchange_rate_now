class ExchangeRatesController < ApplicationController
  def main
    @current_rate = ExchangeRate.current_rate
  end
end
