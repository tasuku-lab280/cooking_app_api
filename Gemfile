source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'rails', '~> 7.0.2', '>= 7.0.2.3'
gem 'mysql2', '~> 0.5'
gem 'puma', '~> 5.0'
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]
gem 'bootsnap', require: false
gem 'rack-cors'

# custom
gem 'graphql'
gem 'apollo_upload_server'
gem 'carrierwave'
gem 'dotenv-rails'
gem 'jwt'
gem 'enumerize'
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
  # custom
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'graphiql-rails'
end
