require File.expand_path('../boot', __FILE__)
require File.expand_path('../initializers/decent_exposure', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Doorstep
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
      g.helper :prefab
      g.stylesheets false
      g.fixture_replacement :fabrication, dir: "spec/fabricators"
    end

    config.autoload_paths += %W(#{config.root}/app/datatables
                                #{config.root}/app/decorators
                                #{config.root}/app/inputs
                                #{config.root}/app/reports
                                #{config.root}/app/helpers
                                #{config.root}/app/sweepers
                                #{config.root}/app/services
                                #{config.root}/app/uploaders
                                #{config.root}/lib)


  end
end
