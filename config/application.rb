require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RedisNaPratica
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # config.cache_store = :redis_store, {
    #   host: "192.168.4.105",
    #   port: 6379,
    #   role: :master,
    #   db: 0,
    #   expires_in: 1.hour,
    #   sentinels: [{
    #     host: "192.168.4.104",
    #     port: 26379
    #   }]
    # }



    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
