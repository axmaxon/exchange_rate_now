class BroadcastCurrentRateJob < ApplicationJob
  extend Broadcastable

  queue_as :default

  def perform(*args)
    self.class.broadcast_rate_change
  end
end
