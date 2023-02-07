class ExchangeRatesController < ApplicationController
  def main
    @current_rate = ExchangeRate.last&.rate
  end
end
