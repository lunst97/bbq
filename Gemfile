source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem "omniauth"
gem 'omniauth-rails_csrf_protection'
gem 'omniauth-facebook'
gem 'omniauth-vkontakte'
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
gem 'mailjet'
gem 'dotenv-rails'
gem 'ed25519'
gem 'bcrypt_pbkdf'
gem 'pundit'
gem 'resque'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'pry-rails'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'rspec-rails', '~>4.0.1'
  gem 'letter_opener'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-passenger'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-resque', require: false
end