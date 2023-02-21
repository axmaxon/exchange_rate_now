class ExchangeRateChannel < ApplicationCable::Channel
  def subscribed
    logger.info 'ExchangeRateChannel#subscribed: Клиент подписан'
    stream_from 'exchange_rate_channel'
  end

  def unsubscribed
    logger.info 'ExchangeRateChannel#unsubscribed: Клиент отписан'
  end
end
