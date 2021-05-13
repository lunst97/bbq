if Rails.env.development?
  Mailjet.configure do |config|
    config.api_key = ENV['MAILJET_API_KEY']
    config.secret_key = ENV['MAILJET_SECRET_KEY']
    config.default_from = ENV['MAILJET_DEV_EMAIL']
    config.api_version = 'v3.1'
  end
elsif Rails.env.production?
  Mailjet.configure do |config|
    config.api_key = ENV['MAILJET_API_KEY']
    config.secret_key = ENV['MAILJET_SECRET_KEY']
    config.default_from = ENV['MAILJET_PROD_EMAIL']
    config.api_version = 'v3.1'
  end
end
