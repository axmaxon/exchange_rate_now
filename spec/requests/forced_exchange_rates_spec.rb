require 'rails_helper'

RSpec.describe 'ForcedExchangeRates', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      it 'returns 302' do
        post '/admin', params: { forced_exchange_rate: { rate: 77.77, expiration_datetime: 1.day.since } }
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'GET /new' do
    it 'returns 200' do
      get '/admin'
      expect(response).to have_http_status(200)
    end
  end
end
