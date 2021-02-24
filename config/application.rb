require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module ErrorCollection
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = "Tokyo"
    config.i18n.default_locale = :ja
    config.paths.add "lib/autoloads", eager_load: true
    config.generators do |g|
      g.test_framework :rspec,
                       view_specs: false,
                       routing_specs: false,
                       helper_specs: false,
                       controller_specs: false,
                       request_specs: true
    end
  end
end
