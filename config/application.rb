require_relative 'boot'

# require "rails/all"
require 'rails'
# require "active_record/railtie" rescue LoadError
# require "active_storage/engine" rescue LoadError
require 'action_controller/railtie' rescue LoadError
require 'action_view/railtie' rescue LoadError
require 'action_mailer/railtie' rescue LoadError
require 'active_job/railtie' rescue LoadError
require 'action_cable/engine' rescue LoadError
# require "action_mailbox/engine" rescue LoadError
# require "action_text/engine" rescue LoadError
require 'rails/test_unit/railtie' rescue LoadError
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ProductWeigher
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
