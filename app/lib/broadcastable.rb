module Broadcastable
  def broadcast_rate_change
    ActionCable.server.broadcast('exchange_rate_channel', rate: ExchangeRate.current_rate)
  end

  def set_broadcasting_after_expiration(expiration_datetime)
    BroadcastCurrentRateJob.set(wait_until: expiration_datetime).perform_later
  end
end
