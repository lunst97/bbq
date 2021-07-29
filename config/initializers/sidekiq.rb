$redis = Redis.new

url = ENV["REDISCLOUD_URL"]

if url
  Sidekiq.configure_server do |config|
    config.redis = { url: url }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: url }
  end
  $redis = Redis.new(:url => url)
end
#
# Sidekiq.logger = Logger.new(Rails.root.join('log', "#{Rails.env}_sidekiq.log"))
# Sidekiq.logger.level = Logger::ERROR