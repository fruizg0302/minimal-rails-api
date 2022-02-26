require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FoundationPocStackRuby
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    #This is a API Only App
    config.api_only = true

    #We are not serving files from this application
    config.middleware.delete Rack::Sendfile

    #We are sending only JWTs for Auth
    config.middleware.delete ActionDispatch::Cookies
    config.middleware.delete ActionDispatch::Session::CookieStore

    #We are not rendering HTML from this service
    config.middleware.delete Rack::MethodOverride

    #Telemetry usually uses other marker to determine runtime response
    config.middleware.delete Rack::Runtime

  end
end
