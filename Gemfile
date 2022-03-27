source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'rails', '~> 7.0.2', '>= 7.0.2.3'
gem 'sprockets-rails'
gem 'mysql2', '~> 0.5'
gem 'puma', '~> 5.0'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'jbuilder'
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]
gem 'bootsnap', require: false

# custom
gem 'graphql'
gem 'carrierwave'
gem 'dotenv-rails'
gem 'jwt'
gem 'rack-cors'
gem 'enumerize'
gem 'devise'
gem 'devise_token_auth', '>= 1.2.0', git: "https://github.com/lynndylanhurley/devise_token_auth"
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'rails-i18n'

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]

  # custom
  gem 'annotate'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'pry-rails'
end

group :development do
  gem 'web-console'

  # custom
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'graphiql-rails'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
