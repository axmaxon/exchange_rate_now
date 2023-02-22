module Broadcastable
  def broadcast_rate_change
    ActionCable.server.broadcast('exchange_rate_channel', rate: ExchangeRate.current_rate)
  end
end
