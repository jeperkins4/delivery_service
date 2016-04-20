require 'sidekiq'
require 'sidekiq-status'
#require 'raven/sidekiq'

Sidekiq.configure_client do |config|
  config.average_scheduled_poll_interval = 0.1
  config.client_middleware do |chain|
    chain.add Sidekiq::Status::ClientMiddleware
  end
  redis_url = ENV['REDISTOGO_URL'] || 'redis://localhost:6379/2'
  config.redis = { url: redis_url, size: 5 }
end

Sidekiq.configure_server do |config|
  config.average_scheduled_poll_interval = 0.1
  config.server_middleware do |chain|
    chain.add Sidekiq::Status::ServerMiddleware, expiration: 30.minutes # default
  end
  config.client_middleware do |chain|
    chain.add Sidekiq::Status::ClientMiddleware
  end
  redis_url = ENV['REDISTOGO_URL'] || 'redis://localhost:6379/2'
  config.redis = { url: redis_url, size: 13 }
end
