require 'sidekiq/cron/job'

Sidekiq::Cron::Job.create(
  name: 'Get exchange rate once a day',
  cron: '0 5 * * *',
  klass: 'GetExchangeRateJob'
)
