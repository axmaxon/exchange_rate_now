require 'rails_helper'

RSpec.describe ExchangeRateChannel, type: :channel do
  it 'subscribes to a stream' do
    subscribe

    expect(subscription).to be_confirmed
    expect(subscription).to have_stream_from('exchange_rate_channel')
  end
end
