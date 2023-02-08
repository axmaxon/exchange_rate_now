Rails.application.routes.draw do
  root 'exchange_rates#main'
  get 'admin', to: 'forced_exchange_rates#new'
  post 'admin', to: 'forced_exchange_rates#create'
end
