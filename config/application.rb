require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"

# require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

MAILJET_API_KEY = ENV['MAILJET_API_KEY']
MAILJET_SECRET_KEY = ENV['MAILJET_SECRET_KEY']
MAILJET_SENDER = ENV['MAILJET_SENDER']
YANDEX_API = ENV['YANDEX_API']
S3_ACCESS_KEY = ENV['S3_ACCESS_KEY']
S3_SECRET_KEY = ENV['S3_SECRET_KEY']
S3_BUCKET_NAME = ENV['S3_BUCKET_NAME']

module Bbq
  class Application < Rails::Application

    config.load_defaults 6.1

    config.time_zone = 'Moscow'

    config.i18n.default_locale = :ru
    config.i18n.locale = :en

    config.generators.system_tests = nil
    config.action_mailer.delivery_method = :mailjet

    config.generators do |g|
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end
  end
end
