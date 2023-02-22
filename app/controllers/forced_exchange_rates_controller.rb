class ForcedExchangeRatesController < ApplicationController
  include Broadcastable

  def new
    @forced_exchange_rate = ForcedExchangeRate.last || ForcedExchangeRate.new
  end

  def create
    new_exchange_rate = ForcedExchangeRate.new(forced_exchange_rate_params)

    if new_exchange_rate.save
      broadcast_rate_change

      redirect_to admin_path, notice: "Сохранено"
    else
      render :new
    end
  end

  private

  def forced_exchange_rate_params
    params.require(:forced_exchange_rate).permit(:rate, :expiration_datetime)
  end
end
