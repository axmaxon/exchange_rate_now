source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.1.7'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'redis', '~> 4.5', '>= 4.5.1'
gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'
gem 'sidekiq', '~> 6.5.8'
gem 'sidekiq-cron', '~> 1.9', '>= 1.9.1'
gem 'httparty', '~> 0.21.0'
gem 'nokogiri', '~> 1.14', '>= 1.14.2'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 6.0', '>= 6.0.1'
  gem 'shoulda-matchers', '~> 5.3'
  gem 'factory_bot_rails', '~> 6.2'
end

group :development do
  gem 'web-console', '>= 4.1.0'
end
