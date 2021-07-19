require 'resque'
require 'resque/server'

uri = URI.parse(APP_CONFIG['redis_to_go_url'])
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

# Load all jobs at /app/jobs
Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }

Resque.logger = Logger.new(Rails.root.join('log', "#{Rails.env}_resque.log"))
Resque.logger.level = Logger::INFO