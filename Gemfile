source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'devise'
gem 'devise-i18n'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
gem 'uglifier', '>= 1.3.0'
gem 'russian'
gem 'webpacker', '~> 5.0'
gem 'carrierwave'
gem 'rmagick'
gem 'fog-aws'
gem 'aws-sdk'
gem 'mailjet'
gem 'dotenv-rails'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'pry-rails'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
end