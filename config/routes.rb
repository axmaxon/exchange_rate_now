require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root 'exchange_rates#main'
  get 'admin', to: 'forced_exchange_rates#new'
  post 'admin', to: 'forced_exchange_rates#create'
end
